Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A9B25D533
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 21:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746825052; cv=none; b=kYDL9u53AtX6OjEH+UN/c8VQKsucUlxhE0e+mg9vpUEUM9xNScB4O8Bpmrb3AhDHPiUbIOzLBGURU4CZFihFVm6f2M7h+iFp/TAMj9H17h33KB/sDigHsspPX+se6LLE3bdSH2PhwX63CSzwIGz5KnKNxw96DwppV3ZBUv4ROfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746825052; c=relaxed/simple;
	bh=FQ1HxXVjMIwdWjY48SfA/dMkncnqAPudeIJX1PpcmnU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UMCbCsZA+vYzp+XSElarKCOJWhi6NPexCz+UwwOx8hpw5bxtPf47RTqMG1XGOJ/6L/i6E6dWAUYy2lSfV/Minb/rWa+Vnb/gFGa7sTU3fNjVqPamSsFa2mCoWpFrO1z1GgKR1bvllEeq7Q3sBkVhUL48rZyqnOSfulSgIDyl+KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MgCaXLm4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MgCaXLm4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3730BC4CEE4;
	Fri,  9 May 2025 21:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746825051;
	bh=FQ1HxXVjMIwdWjY48SfA/dMkncnqAPudeIJX1PpcmnU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MgCaXLm4/2+yUCI20puzl171P3reSCQzAA9h1eYDXirV8Dvw3cNoZO1mLug9oB7yz
	 mLCcEySCVjsW0uqjO6LhUzlekq6ptsPyHPOVpaSIqS5NB3/zyxu1g+l5CWuroG4hAW
	 yqK7kz/WQ5zFwsQj9M+8u7nkyHPSTASGvK8DXckk=
Date: Fri, 9 May 2025 14:10:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>, Zi
 Yan <ziy@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rafael@kernel.org, Danilo Krummrich <dakr@kernel.org>, Ritesh Harjani
 <ritesh.list@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>, Yury Norov
 <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration
 to reduce boot time
Message-Id: <20250509141050.4b19bc796d7edf2eb9027361@linux-foundation.org>
In-Reply-To: <d19ad41c-069d-436d-8fea-a05188adcb0e@linux.ibm.com>
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
	<aBdK2EIMYYRmmEwA@kernel.org>
	<a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
	<188fbfba-afb4-4db7-bbba-7689a96be931@redhat.com>
	<aBhoqpC4Jy-c-74p@localhost.localdomain>
	<74c500dd-8d1c-4177-96c7-ddd51ca77306@redhat.com>
	<aBhuZWpZ7ltMuOe0@kernel.org>
	<8180a50d-eebe-4f9b-9ce8-d886654a992d@redhat.com>
	<aBi8Iqp27jXLUWfs@kernel.org>
	<78bc6a1b-164e-4925-a624-a271a4499364@redhat.com>
	<d19ad41c-069d-436d-8fea-a05188adcb0e@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 9 May 2025 21:10:34 +0530 Donet Tom <donettom@linux.ibm.com> wrote:

> >> Then we can drop the call to register_memory_blocks_under_node() from
> >> register_one_node() and add creation of memory blocks to 
> >> node_dev_init(),
> >> i.e.
> >>
> >> node_dev_init()
> >>    for_each_node(nid)
> >>      __register_one_node(nid)
> >>        for_each_mem_region()
> >>          /* create memory block if node matches */
> >
> > Yes exactly, that makes sense.
> 
> Hi Andrew and Mike
> 
> Based on the discussion so far, it is clear that the patch will work in all cases,
> including when CONFIG_ARCH_KEEP_MEMBLOCK  is disabled. Just checking —
> would you prefer to take this version, or should I send a v4?

My mind is a blank and perhaps some alterations were picked up along
the way so I think a full resend would be safer, please.
