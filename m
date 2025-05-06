Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6521F4C9D;
	Tue,  6 May 2025 10:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527198; cv=none; b=UsJ6W28yI5ff66ucPgSu+qr7j47ZmzlGWqr0PtLkOnDNn5jSZVowQBLyqf7IKf+Bp4TPOqla/xldr2OfK70wuI16tyPfk4kJX/sEEm5mg35bBvW9uYXV87ivrWFb3cGW+5c8AsOmw0E1eQdGguMlD6oQCPI16r/DxeRoWcCzFLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527198; c=relaxed/simple;
	bh=9mRHDYKby7wkLKdArVGiiiGYXjx7MwW/PwXAzRu0mw4=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cb1ya7iXUiETK0UIM94QpdD+EN5YqEbtRYQW3ZlCgx+cW7QR0zJNngtW97SDLwb3DnwP8sZ9i89dfOzmCvcGNdDgKEy8HRmHymJt335ps+CIaZz0usxAx5YEPeku3bH1Bom4q5Td5meswrFzInq4aOGdS6aRBaU1LZNcLOagDXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZsDwD2g0Vz6M4YD;
	Tue,  6 May 2025 18:22:04 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id C2B741402FC;
	Tue,  6 May 2025 18:26:33 +0800 (CST)
Received: from localhost (10.47.68.20) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 6 May
 2025 12:26:33 +0200
Date: Tue, 6 May 2025 11:26:27 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<mark.rutland@arm.com>, <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 1/6] of: add infra for finding CPU id from phandle
Message-ID: <20250506112627.00004a7f.alireza.sanaee@huawei.com>
In-Reply-To: <20250504-eminent-sepia-cuscus-fc7f7e@kuoka>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
	<20250502161300.1411-2-alireza.sanaee@huawei.com>
	<20250504-eminent-sepia-cuscus-fc7f7e@kuoka>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500003.china.huawei.com (7.182.85.28)

On Sun, 4 May 2025 19:48:11 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Fri, May 02, 2025 at 05:12:55PM GMT, Alireza Sanaee wrote:
> > Get CPU id from phandle. Many drivers get do this by getting hold
> > of CPU node first through a phandle and then find the CPU ID using
> > the relevant function. This commit encapsulates cpu node finding
> > and improves readability.
> > 
> > The API interface requires two parameters, 1) node, 2) pointer to
> > CPU node. API sets the pointer to the CPU node and allows the
> > driver to play with the CPU itself, for logging purposes for
> > instance.  
> 
> Run checkpatch - missing SoB.
Shoot! I guess I know what happened! Will use the script.
> 
> > ---
> >  drivers/of/cpu.c   | 24 ++++++++++++++++++++++++
> >  include/linux/of.h |  8 ++++++++
> >  2 files changed, 32 insertions(+)
> > 
> > diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
> > index 5214dc3d05ae..1e8d1fa04d3c 100644
> > --- a/drivers/of/cpu.c
> > +++ b/drivers/of/cpu.c
> > @@ -173,6 +173,30 @@ int of_cpu_node_to_id(struct device_node
> > *cpu_node) }
> >  EXPORT_SYMBOL(of_cpu_node_to_id);
> >  
> > +/**
> > + * of_cpu_phandle_to_id: Get the logical CPU number for a given
> > device_node
> > + *
> > + * @node: Pointer to the device_node containing CPU phandle.
> > + * @cpu_np: Pointer to the device_node for CPU.
> > + *
> > + * Return: The logical CPU number of the given CPU device_node or
> > -ENODEV if
> > + * the CPU is not found. If the property is not found, it returns
> > -1. On
> > + * success, cpu_np will always point to the retrieved CPU
> > device_node.
> > + */
> > +int of_cpu_phandle_to_id(const struct device_node *node,
> > +			 struct device_node **cpu_np)
> > +{
> > +	if (!node)
> > +		return -1;
> > +
> > +	*cpu_np = of_parse_phandle(node, "cpu", 0);
> > +	if (!cpu_np)
> > +		return -ENODEV;
> > +
> > +	return of_cpu_node_to_id(*cpu_np);  
> 
> You leak the node... or intention was to return it to the caller, but
> then you need to document that caller must drop the ref.
That's fair, I include documentation for that.
> 
> Best regards,
> Krzysztof
> 
> 

