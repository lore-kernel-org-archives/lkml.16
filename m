Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25975DF42
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 20:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746389026; cv=none; b=naJc0KbiyLu9Z7BMh1hsdaguknvjlEDapA8ukXcgra0f/IhzLVKYpfpFcle8Lh+l4NNg4XlYCrTF4eFvL/qTWJMVBN6bGuv0+CwO9kBVcm8gCh/Ua3FSKm1I4k0cwFUfANQqNQYa7D5Ghnca7JTHrfTjkvWL1mh6o1shUq8pFi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746389026; c=relaxed/simple;
	bh=RgY9iTnys8P2ONbSAUPVIwDSToabWfIAOIn4nf0Nidg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pND5YMhQWVcxXvQWY1vAV4o1lJ/JzHsZ08t/JC2nq7pjLnGNKiY+dSx4wku3V9cIxHfbFni4Oj4NBAJQNxPV9z64uKO5Egc2caPAEGZwp2fsQWv1Vacxr53QwhKnhOluhaQlzDww1ooC4/vVJadqHJd9c7/K6Mw7qwVA/r/cjcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cS1/z+8h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cS1/z+8h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056E9C4CEE7;
	Sun,  4 May 2025 20:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746389024;
	bh=RgY9iTnys8P2ONbSAUPVIwDSToabWfIAOIn4nf0Nidg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cS1/z+8hINR+cERlxh+9AyNz2o6fcUahozwFEZysvn13eJcv9PYHfHH8pQe3uY4WZ
	 vy4LSZMxoyB7kFqfbkMMqzGRwa37Sfe3zEl3/AycWczgIcVHoBORFHkc9rtOCPo8q1
	 YeA+KT+35xHJAcBwrYqYyjviFnydIpXCPYFkT+FQ=
Date: Sun, 4 May 2025 13:03:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, Danilo
 Krummrich <dakr@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Alison Schofield
 <alison.schofield@intel.com>, Yury Norov <yury.norov@gmail.com>, Dave Jiang
 <dave.jiang@intel.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration
 to reduce boot time
Message-Id: <20250504130343.d1e7f73040daf053a171a99f@linux-foundation.org>
In-Reply-To: <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
	<aBdK2EIMYYRmmEwA@kernel.org>
	<a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 4 May 2025 22:04:08 +0530 Donet Tom <donettom@linux.ibm.com> wrote:

> If this configuration is disabled, the current patchset would not function
> correctly, and node device initialization could fail during the hotplug path.

I'll remove the mm.git copy of this patchset.

Probably Mike will be taking the series anyway - I grabbed it because
this was unclear to me.

