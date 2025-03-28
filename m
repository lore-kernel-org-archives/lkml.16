Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB01217651
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743156264; cv=none; b=PaF91ekENga0PnqLIsI0wrscurNzp7ETznOSH65hGVxTyn+c7U5oJnKnOP8fOVF2YCeATlkaRItNAry8c7iZ8xs20FmF13W2iLFiW+O4smLuUX3oND38Exrz5zw2FbmttXRykzaXl7ZE7YfbA7tmpauuR3yoLKA1r/63Z77arkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743156264; c=relaxed/simple;
	bh=yVEU9Z9Cc8B9W4xNNyEcyh6tlvqC6ybG2jaMWegweJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R8d1dTaV+qLS35YUVOu6Is8OmT4CajDBKVP3reHqEw4RcOrFUGQ+YX3o/kMz40X/Kt9rUDq/vap3gIqiP99BW7iPsNjm+ozVVzNbeqCHcAoyixH7V0r+GhNkqAeW6W8TEIxZnSv8pms1noXr+riADik3ZBVc2J+SkZ0RnJJ6ivg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g8t9rbZG; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g8t9rbZG"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54993c68ba0so2060481e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743156260; x=1743761060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVEU9Z9Cc8B9W4xNNyEcyh6tlvqC6ybG2jaMWegweJs=;
        b=g8t9rbZGbrlXB5llJq+BBLRV1NBe7VglGZujVNaqfal49bofcjambfiTuvBE70ELRp
         WlnYHFfMzszO9OYPcv40VYrCAPExxm/O/8sYGu+1rmnUXkCeu6E0bbSjZ6hiefUfghru
         qb5Vfx9dI3f0xNMQqXTRVB4WSVLHkbaqs7Gw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743156260; x=1743761060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVEU9Z9Cc8B9W4xNNyEcyh6tlvqC6ybG2jaMWegweJs=;
        b=Lkw3gu5uLVW8bll9e9dQe1rGTEuDQccSiGZ+9sXZolb09Icf5i08G8BJTGEKaBYs2M
         9Zn0X1i4aexuP0r5LQnf3u/4U2quZv0vmddSaWNfbvwdN8UYTWkn+zYgMhbHO+uChziK
         WptMu1s497cDhtD2+Zt02IY8VPs5Y26gxnNQnJXSZpUQXJVe4gPio1F1QtyFEef+h3dC
         jcxOWik5tPC3u3oDjL7cv7bAJu3ZEcETy5Yn5FV+1TagEe0N3oqQxMCiSzn9e0wYlVvC
         mf9ksYTFwbPqRdn/cChI4fKPygiG9+eFaF0F1JmGd4CV9esFj5nq43CojVhKFCleUOPq
         51wg==
X-Forwarded-Encrypted: i=1; AJvYcCX4lvTRNsj1y+WqyCofqvfFyT2dcn15/z3tccev4cfLKlotrWNgp09ZBeRLqeItYM5RDGDWu6UbJMrdW6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyocDNhePaOJ+HnMsDwGYeeTRMAaoFFX41cDSn+Y1oHlC+hNU6K
	EVj6dPyujqdpPzNd0nAWCAXoM1n8jO/glzN1Xw2Qk4U24+1hHIQltyujGRgRTxUTrRp3iQ30eMy
	fZtnM/M9src1UVdt4dXvDNhNMMblwiMXKAXhL
X-Gm-Gg: ASbGncsTY179paKqvKhSvWo8EWVH+AIBlc9sLO7OwIw1LT6dAx6IyiVQx2/blZtISHj
	TY9bovzwITe0mqJzgHrbJNVxY05FDORgWSUNZcU1RgWvw1tyxN+VDXS6EMNuzDKiMUTlZWncghz
	Y+MUV6IMODgGpOc3ZyjBwavBCou4bAf6YNcMUOQYC90lkB1FKc12SD7A==
X-Google-Smtp-Source: AGHT+IHePVtXJ1qJQdbP4+JraAsng3JxPcp8ln2qAoF7z/+m2DWfYuVxIC5W1TfslB1L3LezP+QcBUJ4Mmt/gRVxkjw=
X-Received: by 2002:ac2:4e16:0:b0:549:7145:5d2f with SMTP id
 2adb3069b0e04-54b01221f44mr2788893e87.33.1743156260501; Fri, 28 Mar 2025
 03:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327-fix-mtk-iommu-error-v1-1-df969158e752@collabora.com>
In-Reply-To: <20250327-fix-mtk-iommu-error-v1-1-df969158e752@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 28 Mar 2025 18:04:09 +0800
X-Gm-Features: AQ5f1JruRldxLi3oN3F4vGRjnP_jRoig-8O423pVAOXUeHgChYU13ECJHzNzG14
Message-ID: <CAGXv+5HAa0-AXg6=htNappreR5-9sPHNp7L9ByEBq4XZxADBXw@mail.gmail.com>
Subject: Re: [PATCH] iommu/mediatek: Fix NULL pointer deference in mtk_iommu_device_group
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"Rob Herring (Arm)" <robh@kernel.org>, kernel@collabora.com, Joerg Roedel <jroedel@suse.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 6:48=E2=80=AFPM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> Currently, mtk_iommu calls during probe iommu_device_register before
> the hw_list from driver data is initialized. Since iommu probing issue
> fix, it leads to NULL pointer dereference in mtk_iommu_device_group when
> hw_list is accessed with list_first_entry (not null safe).
>
> So, change the call order to ensure iommu_device_register is called
> after the driver data are initialized.
>
> Fixes: 9e3a2a643653 ("iommu/mediatek: Adapt sharing and non-sharing pgtab=
le case")
> Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe pa=
th")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org> # MT8183 Juniper, MT8186 Tenta=
cruel
