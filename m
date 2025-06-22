Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15121519A6
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 19:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750620225; cv=none; b=GxKPQwld3RWXHb8ijAfNPIB37uGDXpHC3uqZ1xmBLCsLz6Ztad/YNePrOQj9rRUtYDywSshZzpo5GrNB/MEkz95J77B5lujya0tdQj7t1yhA8pvv0HgYQez/dOGusfAI52g0ybswL3MQqBwsJMp1iEX5tghA7Bms+3pnE3fy+gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750620225; c=relaxed/simple;
	bh=IpckR9VGbq4LXi10n8/fWnZTnStHUdYYVsZXeq2sScM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVjFsNTYkqm5BNxnqMq2pHgAMRSgxf0qmGuIayl2m708QqVltqzNeLL7B/1q2ijWex3bjxIzLGvvreMc+XBb44Zs/FbvQ4lx2vMd8vL7YSwqNgrsdpYiPU1Xk9KVXQEkUE3NbGGkcv0z/554cDBX/MtCRQVLMIqeykujak3PvHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SRF/Qdwz; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SRF/Qdwz"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so5391957a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 12:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750620221; x=1751225021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Br5VyEEaKP/ktAugIXCOxiXHE4k+9++aboaKBknJU3g=;
        b=SRF/Qdwzp/iQcqaKSYU3tzN0iv6Ago32NnmH22EnpDwiErBUzXQUDfqKIm0V47rY+H
         5or7iEOEWcf1y+v0ToyX4Jyn0CuxHl+dIASOFkn/NHORf+gq46iARdg+tK3NQqks4KWx
         plwftMcNBftYLiSapv8FiMia01C6CBxKgRWx4x9vSk3xLbjjpSCvkCN4XUcPIBbsE9oy
         9X6sBOKIw0gwPJGCSNF7yCJKwh6ETXfBI2Q4MaqZz4jV99U3MVZ/Gfx4IOlTrxMFYO21
         tSW37ro23IzSGv12Tx+rxrF2QcNEbPSYzKWxqcQAozSjWAAY8ECBLD2oR906sEUi2ldv
         KnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750620221; x=1751225021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Br5VyEEaKP/ktAugIXCOxiXHE4k+9++aboaKBknJU3g=;
        b=C+/0xTSe8QHeFMQ/4T2LK/F1y5YUMbLjOdSmCthoqMfrDpiruRFj15snA4uViGPLbS
         4pH/ldYJSyggmfZuM4ixnM4QxdIpT38o45f8RiW6RaB2QFla84B+rDT27c+NS3Yg737a
         xuLsKqHcsIM7EL5SuKuEipYxeyc6HsIt9mE041+LJDW93AHjzQWpJdC6ukJxH50j/opo
         +ij0VgGkOC1oV7iUcnGRx21xZq9SJAON+gmRqNc+WL48SgQQG/LCdzlCXSci0dhZVGCy
         dcTwkt9mlpMWGyM/fYiSikbgloVyU+6sKHTOZ1zXZzXM0VO+PFil6gDIA+o3Pn67plD0
         ZZwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+pfFU6nSThS1vqpGRs0SATHvm+qlQ/bVKJM5cWQUNmbTNo4TdHxpvui0QN1/RatwcYMi12wzgmg26R4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQSD8jv18Ja8g/68KNhGO6OcPMW2X/OctondRWYQlTaVwlox0H
	vLrf1CKfzjfax4cIs05D2BgyJxbKikeQ3bjkBTjdySCzkvtvSenhrEw2YphQsDtML8g=
X-Gm-Gg: ASbGncuoXG6UMWEJDExaIzRmdThwN2acYnOBA5eq+H6DoP1laWbCmg0tBF8p7Vm64gB
	gZ3SxtNENaOJR5yh3e4IFGqDZS1UBYtp4sa7wMN1yT8fvkAfMcDQWbDDRJyPDfdtTA0pXWz6hwH
	wUYnx/b/h9s4Rp+Sgs8W1R12AyQ/kQ1EBtjqn31Tvq2l8hmbcncDwNeOFKQemI2YDE76T/gQaI2
	1S38D5IYNrVDbOorQHwpO4lNffCpyzsxHrtOVyAhX8d5ytkrkJcWg1+NeHk33LeuEv5F2pBOtfw
	oTN3Zq2gFA9dp6LuoboA72l2JeobNJX6jH6FlEL8K7Ivsl35RINnPr7cRkU=
X-Google-Smtp-Source: AGHT+IE/CAE8fTyyaZhNwnHqQ6DluWGob1BPPepxXx61Kxfg9bpG3qc3aCqfgSMh1y8Qa1MPv/AJwg==
X-Received: by 2002:a17:907:3f1a:b0:ad8:8717:bf9c with SMTP id a640c23a62f3a-ae057ef753fmr1060205766b.32.1750620221305;
        Sun, 22 Jun 2025 12:23:41 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209a2dsm587665566b.174.2025.06.22.12.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 12:23:39 -0700 (PDT)
Date: Sun, 22 Jun 2025 22:23:36 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
	bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
	konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
	quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V6 01/10] scsi: ufs: qcom: Prevent calling phy_exit
 before phy_init
Message-ID: <aFhYOMPdCiCL2EV7@linaro.org>
References: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
 <20250526153821.7918-2-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526153821.7918-2-quic_nitirawa@quicinc.com>

On 25-05-26 21:08:12, Nitin Rawat wrote:
> Prevent calling phy_exit before phy_init to avoid abnormal power
> count and the following warning during boot up.
> 
> [5.146763] phy phy-1d80000.phy.0: phy_power_on was called before phy_init
> 
> Fixes: 7bac65687510 ("scsi: ufs: qcom: Power off the PHY if it was already powered on in ufs_qcom_power_up_sequence()")
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
