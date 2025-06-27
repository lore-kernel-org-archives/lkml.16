Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABD62D3A77
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026401; cv=none; b=bGJS5/tXIJodr6MCjX9+aSbkyhOqrrvYqagdnv87GNDadZbRcsgwpN+a6kMxMqtOt9whOT3TnFEhUYnALLUIBmyhE5FEtfOSZJTlEh0tP29cq4U0p3h3EeHVL5aWECUDEGBvXkLIfnVXKDi3ymh3lVmETS7266bo1mgr6YNBalo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026401; c=relaxed/simple;
	bh=wJc4Yq/2qIbN+YrM8hSbDxvEt1nc0UwcLw7/Vd6Yz4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GnPKSkd8beS+FGD11zUf4k5ftXvtLB2oAEm3pAFq64mYx09BDl4Z0zsZkQXijVR4oa4zZT3d+BcyU0480Bj8VICOGTC2KIQx6T4yL/JOIWEWEefNEXuWn8nuidTmkl3+RBiNJGOELQAvvfR66Ak91e6tRzPn5I5L5jFUuSnlwdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FUqS2Dcw; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FUqS2Dcw"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-87f4c8e9cdcso505641241.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751026398; x=1751631198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/kboISUHVl7C5fi/y0/ImSh6YAy6f5eQsfdMQeLy6w=;
        b=FUqS2DcwK+V/GuMNs/bvIDtRNcKAxkThnpSfto9Ojx+NHIYg6IJtcuI6UsmQOuRxgR
         0mkKzQj2NByv374S9sriHTv61WRYfHanTWhOep19GDfaZAnQXxla62MYffB2C38AfXd4
         hm7JkIHcDe6NPRL8HIJaDhgm6xYLOxpm+++FU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751026398; x=1751631198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/kboISUHVl7C5fi/y0/ImSh6YAy6f5eQsfdMQeLy6w=;
        b=Kdj1YKMmH90QEQLfdqDK+0r3NIVqJqiB00RCHeEyr6PDxN0RG9DxxJLb8XejZbxb2z
         g0SJ63I5W2LbiMINrERvb2KHMMZkkY9n/Uki5XXQAwcq8s1BrqCF/7/eZ9PnocAB2qKP
         +VgfrESMv5LKuzL88i7eX9WtKfmJjWwlatdoBmak0j+jbUuF7ck70f7xSRSIVy2g9H7T
         IdsVrQZOEISOVSRaHuVoxAUfvjaIMRyflyMIMO54RajTFBm3dcJ1gu4lYgQdRIz30yHy
         tferiluJCrrVGF2PesNociJDzTC0IclIF5p6wAQkVKGdmCQ6pjLfgNZGyLHPAelI+OMr
         L9Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVeL+kHWJUkCVCNAiOfjNk1tCn+8jK4u7b6ZYuX4JmHCnUocrzyobPuiNhlPQGkDu/6TSbYOrO79SnNIU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyacDRcEJ4Y7iY0QdkfzJLR9K8hQHw1e/aA9jExFO/S4WrJpheN
	+NC2zXWym7O5xMDbCb6HLXmrjEazXuL6VnshxBEgagITC4lZsvS2kIN/4HJaIyc6iD4ZinETzj8
	L0YU=
X-Gm-Gg: ASbGncuM5pl6Ok4fH2jssHKtI+Jx1qgtonJRiKP6di1p3Nhqk4tM3rPy1Ck0tWVNJ8b
	Cde4J5WT2u2Q7Xs5LwPhfd5b3eN/zCP/HwFOks7UocazT6iONGqrLx0+0c7CNWbHJ+k5W4vQueD
	RNJK5pdwv9/WvsGiwVEBJK+W3ENgUJDw60FwwjgswTaaDS4GXFv6V8qORJPV/bT+WymstZ3ZFPg
	sViB+0VEJPgfzMcm7OY4w3Opsz/VhMF5mxeB+VDQJLAX/9dYg3xNZ7RG51/DjdfIFr0OrKkbo3t
	+d1zM1rUa2v7D0VPyjpCU/8VkWQBgY//bJ0TSrPq5Cy8ZBj5CwFdUQv8Uvm/l3TWuQm03R1cyC0
	SseLCqnN8ytoO38oEc+i7dw==
X-Google-Smtp-Source: AGHT+IFZ+Hm5WaBR5iSSeCUlLv4PD6W9+y42s2zV7rRE9/IlTUtvFks9CIj3M1Iv5OVr5BF0oJ6l3A==
X-Received: by 2002:a05:6102:a4d:b0:4ec:c548:e10e with SMTP id ada2fe7eead31-4ee4f4e672cmr2376390137.3.1751026397820;
        Fri, 27 Jun 2025 05:13:17 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-884d1c3781esm589443241.10.2025.06.27.05.13.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:13:17 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4c9cea30173so481319137.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:13:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXlI/XIGFwPEmMBX/t7ixumGMx1419XeWlT5hC9KgpakfhBt5v229NdHttpg5hfj2NkCrwRIPfJqCLP2wQ=@vger.kernel.org
X-Received: by 2002:a05:6102:b10:b0:4e5:59ce:471b with SMTP id
 ada2fe7eead31-4ee4f8fa5cbmr2358879137.23.1751026395186; Fri, 27 Jun 2025
 05:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com> <20250623120154.109429-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250623120154.109429-3-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Jun 2025 20:12:39 +0800
X-Gmail-Original-Message-ID: <CAC=S1njT6ygGuZDPU5KDW94Nu-TbM21DM-6HdR7Pio=WTD_eQA@mail.gmail.com>
X-Gm-Features: Ac12FXwNi69jmRwGOUm8UJ7WfMt6niSy4CkLT9-9z1YDS1Mi3aHTobxjbgMPxFw
Message-ID: <CAC=S1njT6ygGuZDPU5KDW94Nu-TbM21DM-6HdR7Pio=WTD_eQA@mail.gmail.com>
Subject: Re: [PATCH v1 02/13] pmdomain: mediatek: Refactor bus protection
 regmaps retrieval
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, ulf.hansson@linaro.org, 
	y.oudjana@protonmail.com, wenst@chromium.org, lihongbo22@huawei.com, 
	mandyjh.liu@mediatek.com, mbrugger@suse.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 8:02=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation to add support for new generation SoCs like MT8196,
> MT6991 and other variants, which require to set bus protection on
> different busses than the ones found on legacy chips, and to also
> simplify and reduce memory footprint of this driver, refactor the
> mechanism to retrieve and use the bus protection regmaps.
>
> This is done by removing the three pointers to struct regmap from
> struct scpsys_domain (allocated for each power domain) and moving
> them to the main struct scpsys (allocated per driver instance) as
> an array of pointers to regmap named **bus_prot.
>
> That deprecates the old devicetree properties to grab phandles to
> the three predefined busses (infracfg, infracfg-nao and smi) and
> replaces it with a new property "mediatek,bus-protection" that is
> meant to be an array of phandles holding the same busses where
> required (for now - for legacy SoCs).
>
> The new bus protection phandles are indexed by the bus_prot_index
> member of struct scpsys, used to map "bus type" (ex.: infra, smi,
> etc) to the specific *bus_prot[x] element.
>
> While the old per-power-domain regmap pointers were removed, the
> support for old devicetree was retained by still checking if the
> new property (in DT) and new-style declaration (in SoC specific
> platform data) are both present at probe time.
>
> If those are not present, a lookup for the old properties will be
> done in all of the children of the power controller, and pointers
> to regmaps will be retrieved with the old properties, but then
> will be internally remapped to follow the new style regmap anyway
> as to let this driver benefit of the memory footprint reduction.
>
> Finally, it was necessary to change macros in mtk-pm-domains.h and
> in mt8365-pm-domains.h to make use of the new style bus protection
> declaration, as the actual HW block is now recognized not by flags
> but by its own scpsys_bus_prot_block enumeration.
>
> The BUS_PROT_(STA)_COMPONENT_{INFRA,INFRA_NAO,SMI} flags were also
> removed since they are now unused, and because that enumeration was
> initially meant to vary the logic of bus protection and not the bus
> where work is performed, anyway!
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

<snip>

>
> +static int scpsys_get_bus_protection_legacy(struct device *dev, struct s=
cpsys *scpsys)
> +{
> +       const u8 bp_blocks[3] =3D {
> +               BUS_PROT_BLOCK_INFRA, BUS_PROT_BLOCK_SMI, BUS_PROT_BLOCK_=
INFRA_NAO
> +       };
> +       struct device_node *np =3D dev->of_node;
> +       struct device_node *node, *smi_np;
> +       int num_regmaps =3D 0, i, j;
> +       struct regmap *regmap[3];
> +
> +       /*
> +        * Legacy code retrieves a maximum of three bus protection handle=
s:
> +        * some may be optional, or may not be, so the array of bp blocks
> +        * that is normally passed in as platform data must be dynamicall=
y
> +        * built in this case.
> +        *
> +        * Here, try to retrieve all of the regmaps that the legacy code
> +        * supported and then count the number of the ones that are prese=
nt,
> +        * this makes it then possible to allocate the array of bus_prot
> +        * regmaps and convert all to the new style handling.
> +        */
> +       node =3D of_find_node_with_property(np, "mediatek,infracfg");
> +       if (node) {
> +               regmap[0] =3D syscon_regmap_lookup_by_phandle(node, "medi=
atek,infracfg");
> +               of_node_put(node);
> +               num_regmaps++;
> +               if (IS_ERR(regmap[0]))
> +                       return dev_err_probe(dev, PTR_ERR(regmap[0]),
> +                                            "%pOF: failed to get infracf=
g regmap\n",
> +                                            node);
> +       } else {
> +               regmap[0] =3D NULL;
> +       }
> +
> +       node =3D of_find_node_with_property(np, "mediatek,smi");
> +       if (node) {
> +               smi_np =3D of_parse_phandle(node, "mediatek,smi", 0);
> +               of_node_put(node);
> +               if (!smi_np)
> +                       return -ENODEV;
> +
> +               regmap[1] =3D device_node_to_regmap(smi_np);
> +               num_regmaps++;
> +               of_node_put(smi_np);
> +               if (IS_ERR(regmap[1]))
> +                       return dev_err_probe(dev, PTR_ERR(regmap[1]),
> +                                            "%pOF: failed to get SMI reg=
map\n",
> +                                            node);
> +       } else {
> +               regmap[1] =3D NULL;
> +       }
> +
> +       node =3D of_find_node_with_property(np, "mediatek,infracfg-nao");
> +       if (node) {
> +               regmap[2] =3D syscon_regmap_lookup_by_phandle(node, "medi=
atek,infracfg-nao");
> +               num_regmaps++;
> +               of_node_put(node);
> +               if (IS_ERR(regmap[2]))
> +                       return dev_err_probe(dev, PTR_ERR(regmap[2]),
> +                                            "%pOF: failed to get infracf=
g regmap\n",
> +                                            node);
> +       } else {
> +               regmap[2] =3D NULL;
> +       }
> +
> +       scpsys->bus_prot =3D devm_kmalloc_array(dev, num_regmaps,
> +                                             sizeof(*scpsys->bus_prot), =
GFP_KERNEL);
> +       if (!scpsys->bus_prot)
> +               return -ENOMEM;
> +
> +       for (i =3D 0, j =3D 0; i < num_regmaps; i++) {

Did you mean BUS_PROT_BLOCK_COUNT?
Consider a case where only regmap[2] is configured.

Regards,
Fei

> +               enum scpsys_bus_prot_block bp_type;
> +
> +               if (!regmap[i])
> +                       continue;
> +
> +               bp_type =3D bp_blocks[i];
> +               scpsys->bus_prot_index[bp_type] =3D j;
> +               scpsys->bus_prot[j] =3D regmap[i];
> +
> +               j++;
> +       }
> +
> +       return 0;
> +}
> +

<snip>
