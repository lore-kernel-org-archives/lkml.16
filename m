Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16EC222586
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747308847; cv=none; b=BIdaYsf38wmUSaO8EXGTy8bhodqGDgo1mYRcz9e2V6H3ixrcSHSH7mGQP+XQR4iKFQ4kUAy+cszHnIWkaUNaKW0oockBGbRyxrrigE4uJ7rwzXtK4cpWuQdBItYdjKQcZmSoU69BqyZ8keUJayU7oxceVm3qL8nqzM3vCafXR8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747308847; c=relaxed/simple;
	bh=7+LcErtOI1nFXpZU0Rnztgx5X/pwtGQnCWrKPIFskJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJ6Au/dOs/4AMYFvsIggk210bQMMJV7EBjIS6YD7jLD1LPxLyAxZMoT5nz8s50xPGVebhnLPBUJt+WsAfabMTFdezHrczbMtyxWJLWitQL30cyeT6W6XALJR0xtKnqA6LZOOjsoWeYGKpVayimPxkirAJZTOrbi8K3sq5eabNiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BroJG+gb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BroJG+gb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so15006955e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 04:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747308844; x=1747913644; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=98/YbywBcXa3bCYk1LSZyotuk6UHXpn6YTL3rzPy1R4=;
        b=BroJG+gbt8NPY47x3lrxw+r/0yZHgU0YoF+ACJ3UYElZwCtVby1cHB3hvEVf2gFRtc
         UZQam4J+NGnXuwt0J07ZZPy4PyzQlGBhuwy+/rRWpNjTtoBMXqlzBhow5EPIxG/h9/7r
         y9oV4MQRDitGvTU2mjTWh5LjDi4YnqKXMAE26CHZtSKhQ9RQGBPMBjYW7UDs+xr5KiIz
         4qncH/LW+mUZHJV1/t5V3lU+ZpP05xnbULuy3Zvz6QfEaCOQOPXnWB1lY9tAuivzulJm
         poRphBU+SjOpe7UBQmxWnGL4LWQ6yFspvI9EkwhNV/mzfZkGPM4c9/6uHoEsSPQHAaYa
         QwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747308844; x=1747913644;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=98/YbywBcXa3bCYk1LSZyotuk6UHXpn6YTL3rzPy1R4=;
        b=OZ9p6ORzx9gbJ+gX/PK5yytG1lNoVoE52kGV50OpoaqS+zmgy0zzB+VyP+Vm83oPkg
         PmKujGKeFAA6LCflyoxO0sCeSlAgnUxmcu21nl8MlxWhezmuzuru8nsVQwDRF02IEwnn
         CVgpektAlwi2hXa0W02Wd1x/jFEX85EQL/pRZ6/8Evc8E/MGlNnxkEhqIQijDd7IOO/U
         IWX33i8UkVfqQwUWFtj4JZm39h0djcEE8w8Zh1VdnacnsmYcGEeM0VlN4phXw/cElx/l
         cxNEbAQAwqPr4YS9FgVylNp4IxVEVG74+CroTO4RT1yJYZXNbofiyr3O7ghVfqaKzFx3
         AToA==
X-Forwarded-Encrypted: i=1; AJvYcCVOBzDbh/pvbF9RHwMJgEGRjjoNnV1wJC+vwizbgQSFQnnFcKVPTcwIYJ9/BZVuUXYaXj3EkT8OUzDy/iw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjpwKKVb8ZJZ76BCgH2ieL935vrS34vDRL3Jh53ilGFfaNx5i3
	yyPc4CA/ylxbxYTVoeAyiesjoq1ehSOw0A7K1fLIV+QduJHoEtNlyg7lkgdWDp0n5s456h/DEkO
	qtQ==
X-Gm-Gg: ASbGncsNHsMfF9yWvHmNwVvRVFL2hIudMvxJuxvI/5cgkWPJ4lOxOh6WauKct/lYAhS
	OlQrck8Znfk23CTkb8qsoCWqSc4+8K5Qr0ZJbchFg9mIIp5e93RuRvaMSBwN921m6jmYcFPu1ov
	ANGt8asVg3zmyXRivozWZdi0j/bjm2K6D2kgQ56P2UUKb7alZaPCUMUjY83qvXsIN8lyXsWATFm
	GZ9/Swu1opKTlgX2bh57sjto99kFYIDLXPjoT5nHUgRU4o2pmgxgp/eWc6avhsKYS/7D/9o148S
	/et7F40nuHJD4KXyfScxQQss1Z+0UfZNnyYCym5QJm5c15Qb/owETE1cfB28HlV0nTk3FOVF3b+
	hYo1lC0B55fnBtw==
X-Google-Smtp-Source: AGHT+IGS0y1s75v6MoXkkoAkzaCFl9AOH+xLlK5hMP3H1elKbtTAhzDq+G0r/OXCG71L82GXmpSfxw==
X-Received: by 2002:a05:600c:828e:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-442f850c4f5mr32380145e9.13.1747308844028;
        Thu, 15 May 2025 04:34:04 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f337db95sm67146915e9.10.2025.05.15.04.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 04:34:03 -0700 (PDT)
Date: Thu, 15 May 2025 12:33:59 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, lpieralisi@kernel.org, kw@linux.com, 
	robh@kernel.org, bhelgaas@google.com, Vidya Sagar <vidyas@nvidia.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, treding@nvidia.com, 
	jonathanh@nvidia.com, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
Subject: Re: [PATCH V4] PCI: dwc: tegra194: Broaden architecture dependency
Message-ID: <6xtdhtiy7bypq36wx5pvaye6oc5wo4os4w37ylrmhcfhwrzcgb@55vxzrwrjh7r>
References: <20250417074607.2281010-1-vidyas@nvidia.com>
 <20250508051922.4134041-1-vidyas@nvidia.com>
 <174722268141.85510.14696275121588719556.b4-ty@kernel.org>
 <aCSUfiwnZRTgMKGT@ryzen>
 <aCSX5gKsehupIC35@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCSX5gKsehupIC35@vaman>

On Wed, May 14, 2025 at 02:17:26PM +0100, Vinod Koul wrote:
> On 14-05-25, 15:02, Niklas Cassel wrote:
> > Hello Vinod, Krzysztof,
> > 
> > On Wed, May 14, 2025 at 12:38:01PM +0100, Vinod Koul wrote:
> > > 
> > > On Thu, 08 May 2025 10:49:22 +0530, Vidya Sagar wrote:
> > > > Replace ARCH_TEGRA_194_SOC dependency with a more generic ARCH_TEGRA
> > > > check for the Tegra194 PCIe controller, allowing it to be built on
> > > > Tegra platforms beyond Tegra194. Additionally, ensure compatibility
> > > > by requiring ARM64 or COMPILE_TEST.
> > > > 
> > > > 
> > > 
> > > Applied, thanks!
> > > 
> > > [1/1] PCI: dwc: tegra194: Broaden architecture dependency
> > >       (no commit info)
> > > [1/1] phy: tegra: p2u: Broaden architecture dependency
> > >       commit: 0c22287319741b4e7c7beaedac1f14fbe01a03b9
> > > 
> > > Best regards,
> > > -- 
> > 
> > I see that Vinod has queued patch 1/2.
> > 
> > Please don't forget that this series requires coordination.
> > 
> > There are many ways to solve it.
> > 
> > 1) One tree takes both patches.
> > 
> > 2) PHY tree puts the PHY patch on an immutable branch with just that
> > commit, and PCI merges that branch, so the same SHA1 of the PHY patch
> > is in both trees.
> > 
> > 3) Send PHY patch for the upcoming merge window. Send PCI patch for
> > merge window + 1.
> 
> 1, 3 works for me, for 2 pls let me know, I need to prep a branch with
> this patch and tag on it...
> 

Feel free to take the patch 1 through PHY tree with:

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

I believe there should be no conflict with the PCI tree.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
