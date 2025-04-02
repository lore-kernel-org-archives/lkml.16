Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C1B20E6E3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743580173; cv=none; b=trdiadmmYi8JHKpC0YpV1v9J5vbBvEnWb9L42pFVrApFjL5vS+JAKaCUkfiQBuqIRx+3w4pwnU+WncrlhtFXgXgfHoJd7txcu7DTGY3vxTyyt9MY6ylA4E1uNH6RUecv6Sab5HMlPgWGd9N6aW/khm345VEx1SGSt6L3JxnqISA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743580173; c=relaxed/simple;
	bh=xmsf9FMkTnLa6YAKeXtlG8+Rxsp/QvAWVR2i827suLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hw+v2pvJJc8i3bNoQQqP2RAv1f7weAKH1BI3JHSo9bT5+Moeh0KW4Q4EDq7KohxZMDfG3sOZs5YdMdbfRRG26ZQyW7j/F/oiAeUorSzTA/X1PcqlU0YPSu4HVtpJ/iGpIpsMyRaY3WciGA0J92sMOCS3szm8T9Zm8vePJEvB7Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XLz/UdiN; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLz/UdiN"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso11260628a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 00:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743580171; x=1744184971; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2aqgbCkNx0PW0vbsTMdXqyfUcPH4h5hP0whKc+xvuD8=;
        b=XLz/UdiNOeZYPvTlaxBXuCF4iyGbtGkpwLGU2CdXzfEHhWDDUToWKOj62SV4eLL/3X
         PNQrjiTWzlrwQlQysPxAmSqdZ3YmDSeijR4pFNX4EpkfNIZ7+3RlB/UV/Ua2d4Sh0DyD
         kNbYn8yw5i73p5ipWIcOdGkxI5k06wDcXZl2hGQ7+M8HD+mRLyKxuZFA33HlAQMsk4jS
         r2Qc0D39PYtaaMjsC+q9BewowLdm0f5SuJU2XWd7N5dncbVb3y8ogmqY5n3lhoi7d132
         agcypRSlU6ryt5uIqxrEZjz5BAOL3OnR24mlZoSuMGZXJwmuAHW4L0XOaN8bqg7WMaul
         onDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743580171; x=1744184971;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2aqgbCkNx0PW0vbsTMdXqyfUcPH4h5hP0whKc+xvuD8=;
        b=KqJUWIybOZe1PLAFTFlSohAnWQJ3gIZUYYvy2oKdkCNepVDjRShJEZyHwFfO6BrTBv
         Y0yivfzZJ1sTmQVermvq1Sumu8ckSvoIpIJe1HUUiaU4J6jKWGy75C18HCUGN6HWsAE1
         eyiSXX7kDIf8LiJb1r+EmzpFSwNaTkqafkIucDoo6Zc5vj2ry7WxODggJLThInPBe9ao
         9DfTcW834Kv9RMDKD8P6le36B9DQ68raSZaH14iEN3Lx6mrr+q9ehaiOxesf4S1Wjf/b
         8UHNATmrguPmqiNsjEhdJU1oM7+TIZSD2hjwExQEf/02ZFOCJaxNi9B5f8BvvdHGLUyK
         R0Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUKELyUGxlpccslsdmdm1/9XG+XYGyuBCiwqxdHYU1zVNny7IoDTsuJiv1gTHTOx1fv27M1KeCdVKVIIiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwprhxM3VI7RqKSkVhn4zlc1w3v2P5FQhWaF8cBWW7nzg4SlR2n
	/CrVL5j8pOkmFwqo4enNkioqrOqIel8I0ntTCvefCaOceF4f+09alokGQUwNWw==
X-Gm-Gg: ASbGncvQXWwIteu8QFL3Jpgxmtx52TqPFB1q3tGoyTHyAPOJ1OhotsP2r2kybzzAnFc
	QzHpfbxYIOAUEcEBG1UDO3Xx8CSAjp3YiugPu8lOS8PPIEwnxrIwavAYy/mgSF8D3KX7xbFmSa6
	o5avGC7Xh2mBPNrsGcZhb98CMbt8YjCjdsdHCnH+hCe3KQawU8SnvvFbEBWs9f1TZavrxdyk888
	v/gCMaTDZVX9NCZkFuMVQaD4xSo9ADEJyCHv6qs3xAtGmhqfsK0bZTblJuLb+Wo/KZjlZAeUjYE
	6nMoe+TJrf3V/eQ80GqI/qULJS3flz0rGx6v43pMJ7usnEtne0pHhsA6
X-Google-Smtp-Source: AGHT+IH8Jzdp+kwIVinSdsTnAiNYI68lWe6D/QP0YRmgVUgFc10NP2fNsve2H8szQGsEUFhU7VB1aA==
X-Received: by 2002:a17:90b:2b88:b0:2ff:62f3:5b31 with SMTP id 98e67ed59e1d1-3053216ddc9mr24513921a91.29.1743580171478;
        Wed, 02 Apr 2025 00:49:31 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3056f83ca51sm892730a91.13.2025.04.02.00.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:49:30 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:19:23 +0530
From: 
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>, 
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
Message-ID: <yzy7oad77h744vf2bdylkm4fronemjwvrmlstnj6x5lzjxg672@zya6toqv4aeg>
References: <4370b3a3b5a5675bb3e75aaa48a273674c159339.1742526978.git.quic_nguyenb@quicinc.com>
 <SA2PR16MB4251229744D717821D3D8353F4A72@SA2PR16MB4251.namprd16.prod.outlook.com>
 <c5ab13ec-f650-ea10-5cb8-d6a2ddf1e825@quicinc.com>
 <0a68d437-5d6a-42aa-ae4e-6f5d89cfcaf3@acm.org>
 <ad246ef4-7429-63bb-0279-90738736f6e3@quicinc.com>
 <3d7b543c-1165-42e0-8471-25b04c7572ac@acm.org>
 <4cb20c80-9bb0-e147-e3c0-467f4c8828ba@quicinc.com>
 <989e695e-e6a4-4427-9041-e39ecf5b5674@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <989e695e-e6a4-4427-9041-e39ecf5b5674@acm.org>

On Fri, Mar 28, 2025 at 07:02:20AM -0700, Bart Van Assche wrote:
> On 3/27/25 5:45 PM, Bao D. Nguyen wrote:
> > Thanks Bart. How about we change the current utp_upiu_query_v4_0 to
> > 
> > struct utp_upiu_query_v4_0 {
> >          __u8 opcode;
> >          __u8 idn;
> >          __u8 index;
> >          __u8 selector;
> >          __u8 cmd_specifics[8];
> >          /* private: */
> >          __be32 reserved;
> > };
> > 
> > Depending on the opcode/transaction, the cmd_specifics[] can be type
> > casted to access the LENGTH, FLAG_VALUE, VALUE[0:63] fields of the QUERY
> > UPIU. The __u8 array[8] would also prevent the compiler padding to the
> > data.
> 
> Are there any user space applications that use the osf3/4/5/6/7 member
> names?

Yeah, we should be cautious in changing the uAPI header as it can break the
userspace applications. Annotating the members that need packed attribute seems
like the way forward to me.

Though, I'd like to understand which architecture has the alignment constraint
in this structure. Only if an architecture requires 8 byte alignment for __be32
would be a problem. That too only for osf7 and reserved. But I'm not aware of
such architectures in use.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
