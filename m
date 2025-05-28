Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAF6288528
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748440827; cv=none; b=PXsAEsEVTIBschOZsW2DO6Q9P/5JmaPgqBmRaJLu2LDtuw1Jccq+qs+WhOEINrOHUTcdKOfyyugoN27zsa4Robh4nB8qVhbVEvsbHj2cE7N+m4RiActVqHXu0oFiGf/dI0Yw3RNZ1bp7x5twsX3GUdwWRR813vLtau5AW0WhGfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748440827; c=relaxed/simple;
	bh=HqmXzcz1Fhb5aWwjj60lQbn31SSuMbIoGTI7rS/zLpk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=iWbKi01dXZPkDlWj3C6XXNhyNkSp6a2r05vMbZG0Iy/TkeEf2ATaQQXWntS77H58IILeYUbJE6fDPWe6qsgQX8TJYlc/D9HfZL8I9hoJxhzvxNdDmZQY2zrF1VTGOJdW/DoskU1jjbE76m/6aXEWTCpsxlg2uGcm40e92RB/8PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFSEQJLT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFSEQJLT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cd6b511cso1100955e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748440823; x=1749045623; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLCejufrq+qP3M9mNyL+ruMGCziYJYfpyzwNMPCLUy4=;
        b=RFSEQJLTchsvDKMOoRbUNsmbJ6wUxuxW4ZORdFRMio+qgL96Xq2QoeIHjIl9FE9pqJ
         ACzfpHfFpN7SDblZtnPfJ0dy7YmaG7haut4dAd6nZdtTf6zWOpagMkdkrjRE6F1Z6w91
         Mmg0jsUZ07xy3h3aUWAVl8pEVkd2CgXTqZURm/x7bfEDaxbpy5Kc6N8gq+opZVA22dAC
         TWsh/8h7vpZFzdkgKr1hQ5j3q66M8H9BE7l7c/FVMbZM0HnO7vL/MLisCCTkWYnm3783
         tJtVy4ERTTcD5FDOv5TfrFbR7mSIRfEwBTDXdG+h7Nna0EeksZ0493/kbQ4bDCAE6JXs
         w9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748440823; x=1749045623;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uLCejufrq+qP3M9mNyL+ruMGCziYJYfpyzwNMPCLUy4=;
        b=Prz3UBklgWb7cF49PkrmLRQiQEdU8hBcJOB1LQbellHcOrhT+19tJbob27uswirkl5
         Ac5Mqsw3iLWCPlah5kZl1s2MrN9IQChzHU9kgQC20ojeATgZ9ES9nC+e7SvA/rBgDu70
         OUWdKK3+EYitB+f6x88Ja6Y+EXXeXjvUOCiBKehZGBP7RWDWfLvaEUANXB84wWd/OyY5
         TY/zZa31G1x/QJn8lfPt6kcRqDVTAwOhYTmyq2Jd68+nxs0baaXTupiXrqCrvn/kGEo+
         PHcXE2+BfLhl7zC6seOqhsySW4ordInM0NHyUniXd6vqs3Ny6yrE000f4vrdXLCuo3m3
         NPJA==
X-Forwarded-Encrypted: i=1; AJvYcCUlyC8BV7Qk/gYOP/e2qIhqsBZsVNQemKVxIdlXwxzrZHzWDbr5Om1T52Iv3F93HPjlXaZpofgLHCzYUr0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+aIiDkbLVvHKjMaL2qG5C1BTWt9Tl5M+G+0I5jzMrppe7xVtU
	FdcbBsxP3dIG1oYjPkrZAPhhiOjrP7plFyHELPAFt1efyQ/VQBNYIQ0geXXDn0n7jU0=
X-Gm-Gg: ASbGncsrmDJTSdpOQ6JAppfnpQirjuZsd13/7hOXV4NivzevH/JRgNdHfgcT/8KLpHU
	/+c+qXjOnMJc42ji5KW10Ou0lBlBs93AQB5epkXr3f0eNDlVx6l8GGa1Vn+imkeiNqrKuPx3BqT
	QmkmCFkE46WmltfYYKPL5Un3U0GFq00bhjR4mr8SKLQDyLbD63wmCtioRlPBXBZOEjfZf1qFj8I
	w7S7EGb+MtYTKHSJpUFOvSt7YMIq8oSAcK3tiloII31LZwgdmxAwM+kb58YOVOJIA4/6ZiI4e1Y
	a0btGNAsM6NCVVYr7rsrYfi5DIj/YUACt0Mc41YszGLAPZ3nFwQmMTFBfIGbMbZVJn4SK+METbR
	Jug==
X-Google-Smtp-Source: AGHT+IG4/Cne7nqOIsE/PY37ws2Wr1tDPTEMkErYoJ1bGl8pKJEeVcseVqH5nyS1AL3VO3u2TuUQQA==
X-Received: by 2002:a05:600c:6386:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-45072545b44mr22307925e9.6.1748440822669;
        Wed, 28 May 2025 07:00:22 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064aeb6csm23449655e9.24.2025.05.28.07.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 07:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 15:00:21 +0100
Message-Id: <DA7UJKPSD154.2FRUF06DRZO7K@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
 <linux-arm-msm@vger.kernel.org>, <joro@8bytes.org>,
 <iommu@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
 <andersson@kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add SM6115 MDSS compatible
X-Mailer: aerc 0.20.0
References: <20250528003118.214093-1-alexey.klimov@linaro.org>
 <ehriorde5zbfoo6b7rzemnzegnwqfdobzwyjra755ynk2me2g6@om6g57n26zbp>
In-Reply-To: <ehriorde5zbfoo6b7rzemnzegnwqfdobzwyjra755ynk2me2g6@om6g57n26zbp>

On Wed May 28, 2025 at 9:52 AM BST, Dmitry Baryshkov wrote:
> On Wed, May 28, 2025 at 01:31:18AM +0100, Alexey Klimov wrote:
>> Add the SM6115 MDSS compatible to clients compatible list, as it also
>> needs that workaround.
>> Without this workaround, for example, QRB4210 RB2 which is based on
>> SM4250/SM6115 generates a lot of smmu unhandled context faults during
>> boot:
>>=20
>> arm_smmu_context_fault: 116854 callbacks suppressed
>> arm-smmu c600000.iommu: Unhandled context fault: fsr=3D0x402,
>> iova=3D0x5c0ec600, fsynr=3D0x320021, cbfrsynra=3D0x420, cb=3D5
>> arm-smmu c600000.iommu: FSR    =3D 00000402 [Format=3D2 TF], SID=3D0x420
>> arm-smmu c600000.iommu: FSYNR0 =3D 00320021 [S1CBNDX=3D50 PNU PLVL=3D1]
>> arm-smmu c600000.iommu: Unhandled context fault: fsr=3D0x402,
>> iova=3D0x5c0d7800, fsynr=3D0x320021, cbfrsynra=3D0x420, cb=3D5
>> arm-smmu c600000.iommu: FSR    =3D 00000402 [Format=3D2 TF], SID=3D0x420
>>=20
>> and also leads to failed initialisation of lontium lt9611uxc driver
>> and gpu afterwards:
>
> Nit: there is nothing failing the lt9611uxc on its own. binding all MDSS
> components (triggered by lt9611uxc attaching to the DSI bus) produces
> the failure.

Oh, I didn't mean to express that something failed in lt9611uxc itself, I
was just trying to list observed problems.
Apart from hdmi bridge and gpu the failed component will be soundcard drive=
r
since it depends on lt9611uxc.. So, if you have rewording in mind feel free
to suggest it.

Or maybe something like this will look better:
and also failed initialisation of lontium lt9611uxc, gpu and dpu is observe=
d:
  (kernel trace as in the original email)

[..]

>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> I'd also propose:
>
> Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM611=
5")
>
> This way this is going to be fixed for all platforms using display on
> SM6115.

Yes. Thanks. Checkpatch suggested "Fixes" tag but it was unclear when it
started to horribly fail during boot -- sometime around 6.14 or 6.15 cycle.

Best regards,
Alexey
