Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAA0224FD
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 18:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743963832; cv=none; b=QW1p+PMkob3yI0yD+6HENbKHnSZB5MoL82vd/Cq84sVjcUIciGZsFqp9UvhMqXqZQLOkJ6L2tL3RT+dKLWIW5jbm/CewyvcLr73p5QiPNzLhFXf97mqZ74jv9iJ8wcwGDST8m+A7pSQVQyt3HJBijSn/FfobDuvXRyMha+AXCGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743963832; c=relaxed/simple;
	bh=IAzy0fh8K5Ij9hbamh80vAnFaq8nFygBt8h0leYVIkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jzsFyPwaHh76ej7Kk7y8Nc3hV+wnHjjtF3U44aZ3RkPB9lexAzeV2n/7yvM9YBpMAPuWYJb3np0kUrZzFEEvCYg/TIH7kSS8KtRNuICXOhKEJ7L0mpjMpFzD9GLx9YDieH5CDQreNFgqBzGWtbQD28l8QuuKKZZSeNpVb3FRmj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cEJxc9ln; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cEJxc9ln"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223f4c06e9fso31332925ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 11:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743963830; x=1744568630; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+3W5JbOyIE71HVwKTUQkHyqilZi+aSbwXv3gNCNt8vU=;
        b=cEJxc9lntGpyYbhlbgqgFWq9NRq/slvr98jMZ/veQwWwnBEJA/p8UvxfGeapC/VMuq
         V+ZV9pevy47AvxA84ZiVLX5NLBS03ujz8iKysxiPcoqEk3CDvt//6wd8R2CpvY67jAam
         ZyYyfmRNvbviYDpuoBjRIaIvrUgq/jAbRPxaYxenOEMiXgxrO5VPJcCNEWsi1FofKmhd
         RHVm82lcl6vm8seK/REtKcNxW1YEp3geuWNgGF7Rzc7tjpP+rv7FocAr2fDSgjzZQuXn
         QAlGQUP51cDwIpyGhDvtrJcAF2q2sQN7y2EOOPyWOTVvUrYXweoKhDCZN6xUMYdKH7Pd
         Y2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743963830; x=1744568630;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+3W5JbOyIE71HVwKTUQkHyqilZi+aSbwXv3gNCNt8vU=;
        b=l8hUTOF0g9d5c5NZLbZXKYf9TAQRoNgv+M6wA1559anv1m0ya0RyrnpwUNL8MKuXV/
         2h+SHmghzYHuRmixI/PLJUEQ/h8j3acChSkOceue32Nx1CsTPM926chl6olRbTT8bw4I
         v01iiqQFRc8Gs5BUQTJ4VcYGUbSe9RBQBUBnRbYEpO7zkHjlxbvZgj5hnKsIa1DT4AKM
         7LFvzXlnDH/3QIaL0hMJdqQ86hLVsC08Cs2BoWa9HBFxfynPYAzeVPjLxyYF5tQbANw7
         KjsAwB642tRMyWxd45gWzuruJ88NbRUhnIa2ZMPoOlRikxfIcAlJp27X16cDhsgTD0xH
         UqZw==
X-Forwarded-Encrypted: i=1; AJvYcCWqyD4d6yQKr7npWu88FQ+GKiGv6lzCIS3O3Jksrl6sHJ7wLlZrwkIu0CiHYCKe5IM/0OYkhSPP8e+b+34=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQWp9FJPbgzecxOUKYz6BgPOAKSoyDOeCL32VyYg144i3j3Qa5
	mVzrvjW7qQNxIcIg6wkataVslT9ss3V9jvMAB6OL1mOQGbIOOh5/YQ8J/tDnFGulSsq82XfclTs
	=
X-Gm-Gg: ASbGncvc4btFGoId0GLvxaiovOCjPpNyc/RRDnci3xI5THXxd0fiYKpn0XsE6lgoLIr
	xN904nckQF7GwlQ2ZGg8DjZ/OOgu5pKxoJmdzKdPX/EHP+reLRg19cYJf/Vg6K/OW/iV0olGqar
	hAzzpgwK0yRygtuGcxGCiFLuYcr0jT4ovB1K1G17i9F+87/dNpYfL5XL4rb0dBmaaJy89+OT1ck
	d+be7uK05XWSxRwFih0v1eNfoAVYuDwmpuHRb2+RW/s101LkMnEqz35BEKj3f5u9fyxLsKBYWaK
	Z4com3dUl69D28T8US66HXXWxxxFRR20gPE2EZljz/QNHffGo4wXfB4=
X-Google-Smtp-Source: AGHT+IFdT0XFI03UAIeiotZXeIYigu0aV7BLlfFTU0OW0vocyL0gj4gwxcJDUVb4tfjT4ZP6NIWT6w==
X-Received: by 2002:a17:903:41c7:b0:223:607c:1d99 with SMTP id d9443c01a7336-22a89992b46mr153666815ad.0.1743963829885;
        Sun, 06 Apr 2025 11:23:49 -0700 (PDT)
Received: from thinkpad ([120.60.71.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e161sm65969765ad.171.2025.04.06.11.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 11:23:49 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:53:41 +0530
From: 
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
Cc: Bart Van Assche <bvanassche@acm.org>, 
	Arthur Simchaev <Arthur.Simchaev@sandisk.com>, "quic_cang@quicinc.com" <quic_cang@quicinc.com>, 
	"quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>, 
	"peter.wang@mediatek.com" <peter.wang@mediatek.com>, "minwoo.im@samsung.com" <minwoo.im@samsung.com>, 
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, 
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bean Huo <beanhuo@micron.com>, 
	Keoseong Park <keosung.park@samsung.com>, Ziqi Chen <quic_ziqichen@quicinc.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Gwendal Grignou <gwendal@chromium.org>, 
	Eric Biggers <ebiggers@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v4 1/1] scsi: ufs: core: add device level exception
 support
Message-ID: <ouxmroni4miwrzd24gvcvo3v5hqthodhhx3ohk4i37qryn4k2w@47s2a6nvxby6>
References: <4370b3a3b5a5675bb3e75aaa48a273674c159339.1742526978.git.quic_nguyenb@quicinc.com>
 <SA2PR16MB4251229744D717821D3D8353F4A72@SA2PR16MB4251.namprd16.prod.outlook.com>
 <c5ab13ec-f650-ea10-5cb8-d6a2ddf1e825@quicinc.com>
 <0a68d437-5d6a-42aa-ae4e-6f5d89cfcaf3@acm.org>
 <ad246ef4-7429-63bb-0279-90738736f6e3@quicinc.com>
 <3d7b543c-1165-42e0-8471-25b04c7572ac@acm.org>
 <4cb20c80-9bb0-e147-e3c0-467f4c8828ba@quicinc.com>
 <989e695e-e6a4-4427-9041-e39ecf5b5674@acm.org>
 <yzy7oad77h744vf2bdylkm4fronemjwvrmlstnj6x5lzjxg672@zya6toqv4aeg>
 <1b87152e-ff0f-9c45-020d-4927ff3dbef8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b87152e-ff0f-9c45-020d-4927ff3dbef8@quicinc.com>

On Wed, Apr 02, 2025 at 12:00:26PM -0700, Bao D. Nguyen wrote:
> On 4/2/2025 12:49 AM, manivannan.sadhasivam@linaro.org wrote:
> > Yeah, we should be cautious in changing the uAPI header as it can break the
> > userspace applications. Annotating the members that need packed attribute seems
> > like the way forward to me.
> 
> Yes, I realized potential issue when Bart raised a concern.
> 
> > 
> > Though, I'd like to understand which architecture has the alignment constraint
> > in this structure. Only if an architecture requires 8 byte alignment for __be32
> > would be a problem. That too only for osf7 and reserved. But I'm not aware of
> > such architectures in use.
> When using "__u64 value;" in place of osf3-6, I saw the compiler padded 4
> bytes, so __packed was needed for me to get correct __u64 value. I thought
> even the existing structure utp_upiu_query_v4_0 may need __packed on some
> fields where the driver reads the returned data in order to be safe across
> all architectures. However, without evidence of an actual failure, I didn't
> touch the existing structure. Only raised potential issue for discussion.
> 

If you change members to be 64bit, then for sure compiler will add padding to
avoid holes. But I don't see any issue with the unchanged utp_upiu_query_v4_0
structure.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
