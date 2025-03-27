Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9401B960
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743076994; cv=none; b=e3bc5GymMmqJKaPicUIb7zTxrJjqvM8VbEHA5sd8SWqzXgSwTnmkZjNjJ7DpcVXlcqQT1tjsLqJ13jFqnAEtVvtByZV9mWUmmjwvtUbnB9GXcV2YX5fz/rCmdG31CjwuapCYEH65YD0jTjoR4gfJPSxWbfWz+DRFMHLRpsszeCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743076994; c=relaxed/simple;
	bh=UJkKSf7fQMEVOKFZamgTNbbKX0+pYHquQYAtDvyOvnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ICnnHeIJZXE0s2DslAYVL+j1RsNXfDNIbaJO3JJMHNmfe5tlOyNaEWS28Zh4YRoGTVg0nblo3xYJ4Xq2wSJmSAb2pCAjylCbeybcYBQlPwZRboHT6EdXBtdMG3Zpq8FXIXMZy+PuXc6xjYy/hPiilqrBDNpqBdWWBDxTNtOcgqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=ghDmfPG2; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="ghDmfPG2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743076939; x=1743681739; i=spasswolf@web.de;
	bh=SM1POh9VV3k0zWrqccD5VWDOjF1RncipJvSoxJViC/g=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ghDmfPG2X/yTzwS3cAxo1t9omIZslCGC6qRb9iOd/Na9V2c6etxsU46/anZL54rM
	 fFYPqT+7kgnRo4g5YOpD2brWvtwwYQaZMyCVlSOWh9dhcPh04MAoiQ83DNZPIyG+7
	 gNnf19MEvZbdqe/5/VgHnwsszuglGkSa6tCdg7Vo1BrM/Z+X/Oi6VYGaHjmI4/6u3
	 Q3K0RDUD5/n5tlEmp/pB63XJ7Ih+VFyz4hYtz241kgXA36BodEJXvAF8IvzAunt+W
	 PmQJLZjFv1YPz+sd+R3Mzn5+XyP9ZENFemLV0BPna670NPI6CYh4fLwwCAuJLpGSr
	 ifZhUdH3FE7BohYBvQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([95.223.134.88]) by smtp.web.de
 (mrweb106 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MSZHv-1tZKEt3IHR-00ShLe; Thu, 27 Mar 2025 13:02:18 +0100
From: Bert Karwatzki <spasswolf@web.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Bert Karwatzki <spasswolf@web.de>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Kees Cook <kees@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v0] kernel: resource: add devm_request_free_mem_region_from_end()
Date: Thu, 27 Mar 2025 13:02:15 +0100
Message-ID: <20250327120216.14083-1-spasswolf@web.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: Z-UuHkUPy60e1GWM@gmail.com
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zUDI+gfzkTnaGlpjaw/Mi3OTj7Gliv+9usoAh1T1d3UUIYx0K53
 NxOTzwzE6QDKdfMpytVP+TqEqPFrU0n8kwx88EwhECN0A3vPCmsknvyDmUUU7zuHpJ/yk+j
 s5aP+CF1KAob+Q2mi2hvn7aOCpML5V6d9It/ItXJ9Os8GrDj40Ayt4JaMd8gPQDglaqzDpN
 eNPNYcupJ9auwgAjbhkPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:U12YhXUhwvM=;GefW0zbxDptGhDwtcP8xpktjuKv
 /If+yDumaiZS5a1SiLZ103nNh9Fmde7WSW2XFr5/0ju/3iGCc0Lt0OmrRPpso2S3X04sz8gtz
 Yv7tBV/OYb+GShCCu0+LyeRLculBS+evmO2QXs7WKvz+Y6WEyUob2IX3SqPUdsexiiO2XhBWV
 CUENkTdx8bU7PU/B0cFewQMaEgbwf5EXS3tFcmEN65AMB1W1qmt0BYcOZ3ioqUW5pPPZMG/Au
 Ar8OXa7pDkm2xfPlKQBjfV6tGytEllKbqCd9lNtD0+U8AQkD/+oIzkfMo7izNq2AGyoqL7EWi
 +waQPelDKsW2wTrxu8dCyYY8alf/SisJEzyRdiqenBKhDo98LH4ZNTDAKzqHQ+qTS7KhfGhRA
 d2XgI/MR97AL0InkRGrfADNaz9JS0S5bZgFDmcYIqCoOW4bZ+vh9Tlz8V09+V4gtuVICkOgqb
 /iLULL5VzyTlz0y54onV8au5i198M7MGCfWRdyhc/K1rpWVmIpnD9c9bYFUCw31SuCOcloXA+
 o2qUmCMKJgcGLoqjSMg8lk4C7DQG1ZOuwt2uZogm8ExehqeWbJwFhuErZH0H1Jfup47VV5YQ0
 NuRD2a/5uEPVAFwaKrs7OClxKNv1tWPu5O4mNawcJJEgHIuMzb3U8IivcsoqkwQ7L+ryU7zKK
 pvPUTwyoqyZbTp6SzRrZf3OyI8WpXnC3Nwqn8iXLjqqTM7YACEGucjV3Hj1OrGdLT/ee8/dID
 GdzMI4AA80mzfZRGWvcmhrrvg+I3LCuC7HgEWAC/2LScEmav05xq2deWl6h0d85hxxDVxT/oc
 47el1CxY1pkMKm1Who2LwAjTnMmFAive1jPMSkNPZBFE1rhauAYW0lM2F78khefz49jcjlsKS
 Nzyzs77CZi8kzRGjB97GcmuPO3Hnubz5cfsp0E7+/dxjXQCtZAFZ/M3TebtT6dUIOIN/MTruZ
 /eeCeA9g3ztcjevUk2nrk7etriUUHuTV0TDXwPhPof8fHvhYscTZGd8h74ObmcPzdBqCGormB
 XoiHYvpPWP7VFLW5LJfyFaVYfEFFKwXsB5iEGi7ZzdY336NfoZKNKwYcf0bROZBYHdszH23E3
 OPvydcWP0C+6oOhE/nds6FxCoyfysXBFLQkyMSu4C3A1Tj8iaCxUyvhoqunNnToHJCIUnnOj1
 I33MOCEoJwtr0dA814oym+8l7eOQLvdHss8LJQR1uqHEFICjyN2k7XnngBdgTXf6Jt5bB8FGy
 WMX4cgbRS31vcOuVKel4EJn6aao6tMiCviLkeBiIJRRwOQOCQOZ+1fzOHaIMcN8zJCvTk23/f
 eJ45Kgz7s9l3LNfZXEbmBmYfUq3J7Gckc0r2b44YUcAXFbGV97cTk4XQ/Uuht+6AFzmT8zFYU
 wmbC9IYVE2JGzgAgRrUrJiZIQkA9abBfQ8jbNbVCeIdSlz72PJwzMp0AM8m/ll549FDZfrMdK
 28IESxEqkvfILUvW6LPUX7bKCI5s=

devm_request_free_mem_region() places resources at the end of the
physical address space, DIRECT_MAP_PHYSMEM_END. If the the dma mask
of a pci device is smaller than DIRECT_MAP_PHSYMEM_END then this
resource is not dma accessible by the device which can cause the
device to fallback to using 32bit dma which can lead to severe
performance impacts.

This adds the devm_request_free_mem_region_from_end() function which
allows to select the endpoint from which to place the resource
independently from DIRECT_MAP_PHYSMEM_END.

Link: https://lore.kernel.org/all/20250322122351.3268-1-spasswolf@web.de/

Signed-off-by: Bert Karwatzki <spasswolf@web.de>
=2D--
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  3 ++-
 include/linux/ioport.h                   |  3 +++
 kernel/resource.c                        | 31 ++++++++++++++++++------
 3 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/am=
d/amdkfd/kfd_migrate.c
index d05d199b5e44..e1942fef3637 100644
=2D-- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -1042,7 +1042,8 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *a=
dev)
 		pgmap->range.end =3D adev->gmc.aper_base + adev->gmc.aper_size - 1;
 		pgmap->type =3D MEMORY_DEVICE_COHERENT;
 	} else {
-		res =3D devm_request_free_mem_region(adev->dev, &iomem_resource, size);
+		res =3D devm_request_free_mem_region_from_end(adev->dev,
+				&iomem_resource, size, dma_get_mask(adev->dev));
 		if (IS_ERR(res))
 			return PTR_ERR(res);
 		pgmap->range.start =3D res->start;
diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 5385349f0b8a..a9a765721ab4 100644
=2D-- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -407,6 +407,9 @@ walk_iomem_res_desc(unsigned long desc, unsigned long =
flags, u64 start, u64 end,

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
+				 resource_size_t align, resource_size_t seek_end,
+				 unsigned long flags)
 {
 	if (flags & GFR_DESCENDING) {
 		resource_size_t end;

 		end =3D min_t(resource_size_t, base->end, DIRECT_MAP_PHYSMEM_END);
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
rce *base,
 	}

 	write_lock(&resource_lock);
-	for (addr =3D gfr_start(base, size, align, flags);
+	for (addr =3D gfr_start(base, size, align, seek_end, flags);
 	     gfr_continue(base, addr, align, flags);
 	     addr =3D gfr_next(addr, align, flags)) {
 		if (__region_intersects(base, addr, size, 0, IORES_DESC_NONE) !=3D
@@ -2021,17 +2023,30 @@ struct resource *devm_request_free_mem_region(stru=
ct device *dev,
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
ce *base,
 	/* Default of ascending direction and insert resource */
 	unsigned long flags =3D 0;

-	return get_free_mem_region(NULL, base, size, align, name,
-				   IORES_DESC_NONE, flags);
+	return get_free_mem_region(NULL, base, size, align, DIRECT_MAP_PHYSMEM_E=
ND,
+				   name, IORES_DESC_NONE, flags);
 }
 EXPORT_SYMBOL_GPL(alloc_free_mem_region);
 #endif /* CONFIG_GET_FREE_REGION */
=2D-
2.49.0

One of the problems (I'm sure there are more ...) with this patch is that
it uses dma_get_mask(adev->dev) as the endpoint from which to place the
memory, but dma_get_mask(adev->dev) returns the dma mask of the discrete
GPU, but what actually is needed to avoid the bug would be the dma mask
of the built-in GPU. In my case both are equal (44bits), but I'm not
sure if they are equal in all cases.

> So this patch does the trick for Bert, and I'm wondering what the best
> fix here would be overall, because it's a tricky situation.
>
> Am I correct in assuming that with enough physical memory this bug
> would trigger, with and without nokaslr?

I think the bug triggers as soon as DIRECT_MAP_PHYSMEM_END is bigger
then the dma mask of the integrated GPU.

> I *think* the best approach going forward would be to add the above
> quirk the the x86 memory setup code, but also issue a kernel warning at
> that point with all the relevant information included, so that the
> driver's use_dma32 bug can at least be indicated?
>
> That might also trigger for other systems, because if this scenario is
> so spurious, I doubt it's the only affected driver ...
>
> Thanks,
>
>	Ingo

Or one could make the endpoint from which the memory resource will be
placed selectable.

Bert Karwatzki
