Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF877224D6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743037107; cv=none; b=e8BVNINdw423xt41cHSJQYBMwKRf8GxnWagJ4WlNwBJv4IhDfiJSxx6RS0qnkTN9sHGY66OeArePHSOAbvzI1OSYBrw4B1Llt8YiRfgSaRRuVmAtv1Bo/iOHs/SxGM4ZE8ed5ZkAjN51ZaDGpiRS3P5qtZEsXOe9BoiqZxfNRlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743037107; c=relaxed/simple;
	bh=IOquQNsqXikxEHdUYqv9PthDdLa5FbkQ8DChFyLvmug=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fNwXiC28nntqPsyBHlfM4SlpcrX0ADaIMrlg2rqpJj7IV9D7RmPJaKWPXBnOCKJCSDww5PSJ4BlQLYGyhw6/8o7AGjWwJdMBixNMRvW8X4fFwHEyV8EKElzhf+Cz/X7w6swYTejxvPBSnyaiVGB5OlwFS6DySnZgQDJlROQ73+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=lzHFnayC; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="lzHFnayC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743037095; x=1743641895; i=spasswolf@web.de;
	bh=Zk++DGlvsIMP57VTwMLNt1Uxow2p23z/s6nbuuf4t0U=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lzHFnayCW/+dYmY3vozboRklybVPaKcSvNXyG4jCGqQU8iv5lV3GO+iLVSrxfJmh
	 uVQmqUlmKVhX24QE/onZCTaPrs3tGPFYeBxp+H55Jnuw19i7woZDl9VeT164OUqYg
	 aNjthklZBLDeKP0CERdMu4gQNmZxvXoXONbJe8hDP5leT+ua9K0eCstpBvnIBYJUa
	 n3XHV8jfTqgHcFqkx98Fpq1QbPtW0/bkjKfOS7Mp39GToHwIKNeiPGXSDdZRPd6j6
	 CbTARLBqW6rYQbe0+l/KXLt0M21hyu7cvNhEBF988ZmekBBMvYr2qgIaXmc4rcOWn
	 u/rNdukMymXJ8Xc5nQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MxHYA-1tDMgJ2C76-00xvKo; Thu, 27
 Mar 2025 01:58:15 +0100
Message-ID: <2d547eae6f031943101d7fb10b815bc128995125.camel@web.de>
Subject: Re: commit 7ffb791423c7 breaks steam game
From: Bert Karwatzki <spasswolf@web.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Balbir
 Singh <balbirs@nvidia.com>, Ingo Molnar <mingo@kernel.org>, Kees Cook
 <kees@kernel.org>,  Bjorn Helgaas <bhelgaas@google.com>, Peter Zijlstra
 <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,  Alex Deucher
 <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, 	spasswolf@web.de
Date: Thu, 27 Mar 2025 01:58:14 +0100
In-Reply-To: <CAHk-=wh5Suzp0z7AnK0NgSKfEAWQJw7Dgv5eku=rzBuM1ugQDg@mail.gmail.com>
References: <20250325101424.4478-1-spasswolf@web.de>
	 <64945196-f05f-478e-a2b5-f0bd58345136@amd.com>
	 <c66e2c03648370d5e5c0745f32ebd58367bbe48b.camel@web.de>
	 <CAHk-=wh5Suzp0z7AnK0NgSKfEAWQJw7Dgv5eku=rzBuM1ugQDg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IdsGvviBFPBn07EoxKeEUywDpVaJ7cSMqnaZ8GzaFg4zi0QMuU8
 5mPvahTOZ3wg1T3nkaOg6CuCs69UynONt7SrTrpbdcfgNDfEuwRXuv3Scn/PneftOngU4Qe
 vgRMQKm/UiY68jmBsjD681lNj6juAauFPZ9MlkwQaQYddnhdIceu8LeiSG1ZzeHrL7OcQg2
 846TN+TMpWlh6hhCMjNLQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KvWPCauSh8o=;Itr7GtNJAEKoVrJaZb+GIEkBhpQ
 UoeIAI1RFsNO4A+IQ8KScpruBxDZ5piOvMbm7KrDgHR6ffInl8O9z4vsD2jdsJhl/+aSrJbeb
 dc8Mn/4QrKPluF0ukbJq3rQNnDGt84RBEMHioMtg2vFRST9giTbkU2iJE5MykudM5I4InO8zU
 5nEqYi0EDDm1kuEm8ooqUI4LzdK8h3WN1o9gC6v7MdhwZHb2m20YDONi02Rd/uBjwLNkPY/B/
 xCbb2+qeiGE5zqOC0kzcPMA9nMWkId//minoLsVZrd9xTYTkqWxSeOmwJhgJyHiMYsWKk8Ohf
 TeTPgi8bhz5YehJNvAeVQK8NobTVdqG67IukZLso8qn4ddq0Iu751hqPkyQACidmhlwsdf0R9
 quiVZw31wNo8WhjIWqWcMtQNdggD4d5e3gtbhTAW5bLmDVgsJlPLanuuEEjBtWQKAodlirT+D
 seximDA2k/eVsq8hF8ZhErX0jdP3smXf/eJDglvF1RbD9BvPwF1gzuZKBxSvL3Cvj1XXn3WgU
 lsNOt+Xf37QA3R/cJ7zdwVQo8wJkqoVmklrjS8nsUDk4K2CmGBinPqnEnklVKMsluMTxRcbev
 80QfNptXjBtJF6GJZdHh9N4V9t0h/avnemzRVRUYqGzDe2baz6uc9cmfOBXKxRj+xQ32UY0Z+
 qKN0CwazUjhTe90TNXF4+CsYSfoYo3K8J8hgrh68zjOAvIcjEQ+NS2m/FKdt60YCXsOSRiYww
 D8JbhWCT5smyn3N4w56EzJJWF6ll/xIVEbzcaS635GtCkiT5Mat/qQk29CYkN0Ve+6EVZb9Uu
 RIk4j/7F6p/yZwth6Pa3GNE9UXcx13SwBNvM98immzgNY0uQtbUkrZ9g9k4+d4zSGqUVKaMjy
 IEBTQmxNKyNV23l3FkAHbOi89sZ67N+xPOZjIrx224Ob0m502goIiVj3k/CuBrfGJatDsCHd7
 anKbSuNhdPqqQiU1Tde4cmrzBdHqVo3nR4PU04OQ/keBRTGNfkESlTbfPFxWiof0Zs8nanZD2
 Vzu+k27lsioMPGALthgrpgrsD4I6VVw4XX7eiYcksRrQoX95fhvpXyVeb0IumJPpIdU+mDr5O
 ef5VXx4FP2YgYL2s+PSp7ehXO5IQjKlk+kpejoWDWoVEbXrQss0+7nNZcqguzW5czoWjUrQyb
 PP5t/d6Rsb7jrvcXEyjE2wb6/BG3318KI7ORaYEjJq/XhSUXavzaN6EfOS7G5wtsL5V9mqdQJ
 /mHxcHjTbmR+BtQZOZVwGtecvy0SG5py1FEAjRsNfyYfdEixB593TKBWmgRiyMZsUz1zf+N9F
 JQ5KWQIJ0iOG1pa70TqZNgpGMKU4GMUFdaGmknVj9CvugnvX0IEMyJGg/LDvbMUSNuKKs9LdQ
 K5Dd0CisndkvJDrO/qQUHzZy6oqoYDbYLxuKu1Kkz6VvG2KGZn0KD8OyoL5pmjRuljnk3XzIs
 CUKV/eA==

Am Mittwoch, dem 26.03.2025 um 15:58 -0700 schrieb Linus Torvalds:
> On Wed, 26 Mar 2025 at 15:00, Bert Karwatzki <spasswolf@web.de> wrote:
> >
> > As Balbir Singh found out this memory comes from amdkfd
> > (kgd2kfd_init_zone_device()) with CONFIG_HSA_AMD_SVM=3Dy. The memory g=
ets placed
> > by devm_request_free_mem_region() which places the memory at the end o=
f the
> > physical address space (DIRECT_MAP_PHYSMEM_END). DIRECT_MAP_PHYSMEM_EN=
D changes
> > when using nokaslr and so the memory shifts.
>
> So I just want to say that having followed the thread as a spectator,
> big kudos to everybody involved in this thing. Particularly to you,
> Bart, for all your debugging and testing, and to Balbir for following
> up and figuring it out.
>
> Because this was a strange one.
>
> >  One can work around this by removing the GFR_DESCENDING flag from
> > devm_request_free_mem_region() so the memory gets placed right after t=
he other
> > resources:
>
> I worry that there might be other machines where that completely breaks =
things.
>
> There are various historical reasons why we look for addresses in high
> regions, ie on machines where there are various hidden IO regions that
> aren't enumerated by e280 and aren't found by our usual PCI BAR
> discovery because they are special hidden ones.
>
> So then users of [devm_]request_free_mem_region() might end up getting
> allocated a region that has some magic system resource in it.
>
> And no, this shouldn't happen on any normal machine, but it has
> definitely been a thing in the past.
>
> So I'm very happy that you guys figured out what ended up happening,
> but I'm not convinced that the devm_request_free_mem_region()
> workaround is tenable.
>
> So I think it needs to be more targeted to the HSA_AMD_SVM case than
> touch the devm_request_free_mem_region() logic for everybody.
>
>            Linus

This patch adds another function devm_request_free_mem_region_from_end()
with an additional argument which allows to choose the end address from
which to place the resource.
The problem here is this uses dma_get_mask(adev->dev) as end address which
uses the dma mask for the discrete GPU while it should use the dma mask fo=
r
the built-in GPU (In my case both are equal (44bits), but I'm not sure if
this is always the case)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index d05d199b5e44..e1942fef3637 100644
=2D-- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -1042,7 +1042,8 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *a=
dev)
 		pgmap->range.end =3D adev->gmc.aper_base + adev->gmc.aper_size -
1;
 		pgmap->type =3D MEMORY_DEVICE_COHERENT;
 	} else {
-		res =3D devm_request_free_mem_region(adev->dev, &iomem_resource,
size);
+		res =3D devm_request_free_mem_region_from_end(adev->dev,
+				&iomem_resource, size, dma_get_mask(adev-
>dev));
 		if (IS_ERR(res))
 			return PTR_ERR(res);
 		pgmap->range.start =3D res->start;
diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 5385349f0b8a..a9a765721ab4 100644
=2D-- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -407,6 +407,9 @@ walk_iomem_res_desc(unsigned long desc, unsigned long =
flags,
u64 start, u64 end,

 struct resource *devm_request_free_mem_region(struct device *dev,
 		struct resource *base, unsigned long size);
+struct resource *devm_request_free_mem_region_from_end(struct device *dev=
,
+		struct resource *base, unsigned long size,
+		resource_size_t seek_end);
 struct resource *request_free_mem_region(struct resource *base,
 		unsigned long size, const char *name);
 struct resource *alloc_free_mem_region(struct resource *base,
diff --git a/kernel/resource.c b/kernel/resource.c
index 12004452d999..82f40407c02d 100644
=2D-- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -1875,12 +1875,14 @@ EXPORT_SYMBOL(resource_list_free);
 #endif

 static resource_size_t gfr_start(struct resource *base, resource_size_t s=
ize,
-				 resource_size_t align, unsigned long flags)
+				 resource_size_t align, resource_size_t
seek_end,
+				 unsigned long flags)
 {
 	if (flags & GFR_DESCENDING) {
 		resource_size_t end;

 		end =3D min_t(resource_size_t, base->end,
DIRECT_MAP_PHYSMEM_END);
+		end =3D min_t(resource_size_t, end, seek_end);
 		return end - size + 1;
 	}

@@ -1920,8 +1922,8 @@ static void remove_free_mem_region(void *_res)
 static struct resource *
 get_free_mem_region(struct device *dev, struct resource *base,
 		    resource_size_t size, const unsigned long align,
-		    const char *name, const unsigned long desc,
-		    const unsigned long flags)
+		    resource_size_t seek_end, const char *name,
+		    const unsigned long desc, const unsigned long flags)
 {
 	resource_size_t addr;
 	struct resource *res;
@@ -1946,7 +1948,7 @@ get_free_mem_region(struct device *dev, struct resou=
rce
*base,
 	}

 	write_lock(&resource_lock);
-	for (addr =3D gfr_start(base, size, align, flags);
+	for (addr =3D gfr_start(base, size, align, seek_end, flags);
 	     gfr_continue(base, addr, align, flags);
 	     addr =3D gfr_next(addr, align, flags)) {
 		if (__region_intersects(base, addr, size, 0, IORES_DESC_NONE)
!=3D
@@ -2021,17 +2023,30 @@ struct resource *devm_request_free_mem_region(stru=
ct
device *dev,
 	unsigned long flags =3D GFR_DESCENDING | GFR_REQUEST_REGION;

 	return get_free_mem_region(dev, base, size, GFR_DEFAULT_ALIGN,
-				   dev_name(dev),
+				   DIRECT_MAP_PHYSMEM_END, dev_name(dev),
 				   IORES_DESC_DEVICE_PRIVATE_MEMORY, flags);
 }
 EXPORT_SYMBOL_GPL(devm_request_free_mem_region);

+struct resource *devm_request_free_mem_region_from_end(struct device *dev=
,
+		struct resource *base, unsigned long size,
+		resource_size_t seek_end)
+{
+	unsigned long flags =3D GFR_DESCENDING | GFR_REQUEST_REGION;
+
+	return get_free_mem_region(dev, base, size, GFR_DEFAULT_ALIGN,
+				   seek_end, dev_name(dev),
+				   IORES_DESC_DEVICE_PRIVATE_MEMORY, flags);
+}
+EXPORT_SYMBOL_GPL(devm_request_free_mem_region_from_end);
+
 struct resource *request_free_mem_region(struct resource *base,
 		unsigned long size, const char *name)
 {
 	unsigned long flags =3D GFR_DESCENDING | GFR_REQUEST_REGION;

-	return get_free_mem_region(NULL, base, size, GFR_DEFAULT_ALIGN, name,
+	return get_free_mem_region(NULL, base, size, GFR_DEFAULT_ALIGN,
+				   DIRECT_MAP_PHYSMEM_END, name,
 				   IORES_DESC_DEVICE_PRIVATE_MEMORY, flags);
 }
 EXPORT_SYMBOL_GPL(request_free_mem_region);
@@ -2055,8 +2070,8 @@ struct resource *alloc_free_mem_region(struct resour=
ce
*base,
 	/* Default of ascending direction and insert resource */
 	unsigned long flags =3D 0;

-	return get_free_mem_region(NULL, base, size, align, name,
-				   IORES_DESC_NONE, flags);
+	return get_free_mem_region(NULL, base, size, align,
DIRECT_MAP_PHYSMEM_END,
+				   name, IORES_DESC_NONE, flags);
 }
 EXPORT_SYMBOL_GPL(alloc_free_mem_region);
 #endif /* CONFIG_GET_FREE_REGION */



Bert Karwatzki
