Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DF0220F2D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 08:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746605966; cv=none; b=l4pJLNlSZvO9vOHf/M6VtImzKJgplidpDGNwYZYKIPcH0NLiEoWcXXe3VqZ2XPfe8B/vZPyRmGjeiLMwdd+guwiIgH86YxSSfW3b+mZfFQQMFBbglU+JENCZp7NwA+J/MzSb2Pgl+AidMqBN8Eje2qiZrBTDSpvptaE1JkxpevY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746605966; c=relaxed/simple;
	bh=Qs1xtwlmZfTdjuWjeZKgY5RsY0l4uekIhHnSOvkO0Aw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gGH4N+D84H8YRr2hHF4Ddo19N+HNXv8CeIoS+n4EbQKkywpSY7F2XnF0X11hY2sTRV2g4aWWzv72/lKgowQrLOTQ6DDSJrJypwBJh1Hh4d05I//rMRYjFM7DaFTJhv7kdLDMTUuJYVDeDnP958gZuqEib+72tzs/FmHZPmBK2Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nHC3M9pu; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nHC3M9pu"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso1045430766b.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 01:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746605963; x=1747210763; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Zdo3sQ6HkJht2f5nXLXDOh1pSVHvyEfnBXICzp6Ti8=;
        b=nHC3M9puraDIz09c0Dw8/BYnuYKUWzzt0ZpgNk0LHXQeub2f/DaAaCmUm+DaStwJu8
         A3gzjs/SZr/GkJkP+l/5Wp8QmhJKSBngaUpyXEI4KZbDe+DRg/f8/4y233uxD9fIif76
         zoAqXDWPoZOgzBQ9JJVVFm5FJy+gcI14ab84a89dd+QExwCUKB7VNroIjJT9wMwt2QiG
         7CxmDBWA+q0YiH/AYhirU6qCnSS8hRBJASEpehgquGGdE3pSQCIK5stviM4QxCmBovTf
         DY1eT11PyTiBhrhD4z+YIuwRaIzMtspUF5kHfpN9ol8MfTKHVKsEU+C0FzBgRqawek3b
         2w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746605963; x=1747210763;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Zdo3sQ6HkJht2f5nXLXDOh1pSVHvyEfnBXICzp6Ti8=;
        b=Kka/hgJ9yL8Ja7oGps0jSYD4gD1b90LEw7e0z3S3YiPUr/dpL1+FrdSW1cjHLM6YGE
         N5UlxeJ60X89F6mEnaVNhQ31FSPocuEdVjSO5tHvKBdRUjzmvMx4eKyQaQRTui9Vt6WA
         UdnpQAQxAOct0AfMx28UERTpqxT0eveAi3OSCUngAmgLINly43jw890i3r43U0KHaBcz
         wIC9JA+K5/OfExGnLn3uppVV2lyaeNWjPJh72XRKSvM4vXBlOw73+XUfia+n/PFhYL3Y
         dtY6qXXPr/agkspiKijuHgrNqV4zcPhaWS1lHXfGkL1uwBjlcl8rNGy41WcNbu8jcbu4
         zinA==
X-Forwarded-Encrypted: i=1; AJvYcCWT6GN14gk9FwkThTWuu+LKGRzeYF0CJ7y4pco9s/I5Ufn4oAaqOS9e2JmvcPZ1/S46HzL9xj98Dpcq1II=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLuUIGyLuvwt19mztVmeT658mqZ8DQWbAfYFM+l86qci5O6m1m
	8WKZQnxj/Y15ujvRZbJdsDi43eDQfi2pz5dGseOd0DoR9w9XlY9TGPU/+U/fS84=
X-Gm-Gg: ASbGncur6oxPqaa59LihFYibPdMTdDeOnM8un6XSRVgHDfegnXEZfIV/e+ehQ1Bftno
	Q49T8LWBY/v4x0LWR70qhmRRXvPbK1Fznh25m3jaEmBMqWpknG+imS67RDuhI67oFIovBBRxMoQ
	nF5az232HRFxacFS4ojRs1vw7LvVezDD+x3+U4B2eryQQD3ij1yMQmJw0fjhnxF70aj0mb3/Vw6
	f49l/ulwzrUbNa3u0PU2ICaqp/Ve+n1tNsg5FpO6JrOQRB7Sovr45RCCc6J0jLHxSO3hwJpjvUi
	EberXU/KDv9dTR+664WvIzI91OBeJ4rgHsuIcnFqJzTLIUizHmjmFuSeZ4Vr9a/mJSAllgRoGZr
	UHnNfrj/X0Q==
X-Google-Smtp-Source: AGHT+IF6eYn3NMUcju73PprGzrvWTDoqzQBMmrsTtNwnfeQYTz03kGFQZmK9f3nJezyms/oYhCgDdA==
X-Received: by 2002:a17:906:dc8b:b0:ac3:b12c:b1f2 with SMTP id a640c23a62f3a-ad1e8bf70damr211096566b.35.1746605962591;
        Wed, 07 May 2025 01:19:22 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0202sm863207066b.93.2025.05.07.01.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 01:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 10:19:21 +0200
Message-Id: <D9PS51XVRKLP.1AHMCRH9CZFWU@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] scsi: ufs: qcom: Map devfreq OPP freq to UniPro
 Core Clock freq
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Ziqi Chen" <quic_ziqichen@quicinc.com>, <quic_cang@quicinc.com>,
 <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
 <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
 <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
 <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
 <neil.armstrong@linaro.org>, <konrad.dybcio@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>
 <20250507074415.2451940-3-quic_ziqichen@quicinc.com>
In-Reply-To: <20250507074415.2451940-3-quic_ziqichen@quicinc.com>

Hi Ziqi,

On Wed May 7, 2025 at 9:44 AM CEST, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
>
> On some platforms, the devfreq OPP freq may be different than the unipro
> core clock freq. Implement ufs_qcom_opp_freq_to_clk_freq() and use it to
> find the unipro core clk freq.
>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 81 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 71 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 7f10926100a5..804c8ccd8d03 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -122,7 +122,9 @@ static const struct {
>  };
> =20
>  static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host)=
;
> -static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long=
 freq);
> +static unsigned long ufs_qcom_opp_freq_to_clk_freq(struct ufs_hba *hba, =
unsigned long freq,
> +												   char *name);
> +static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale=
_up, unsigned long freq);
> =20
>  static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_d=
ev *rcd)
>  {
> @@ -656,7 +658,7 @@ static int ufs_qcom_link_startup_notify(struct ufs_hb=
a *hba,
>  			return -EINVAL;
>  		}
> =20
> -		err =3D ufs_qcom_set_core_clk_ctrl(hba, ULONG_MAX);
> +		err =3D ufs_qcom_set_core_clk_ctrl(hba, true, ULONG_MAX);
>  		if (err)
>  			dev_err(hba->dev, "cfg core clk ctrl failed\n");
>  		/*
> @@ -1414,29 +1416,46 @@ static int ufs_qcom_set_clk_40ns_cycles(struct uf=
s_hba *hba,
>  	return ufshcd_dme_set(hba, UIC_ARG_MIB(PA_VS_CORE_CLK_40NS_CYCLES), reg=
);
>  }
> =20
> -static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long=
 freq)
> +static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale=
_up, unsigned long freq)
>  {
>  	struct ufs_qcom_host *host =3D ufshcd_get_variant(hba);
>  	struct list_head *head =3D &hba->clk_list_head;
>  	struct ufs_clk_info *clki;
>  	u32 cycles_in_1us =3D 0;
>  	u32 core_clk_ctrl_reg;
> +	unsigned long clk_freq;
>  	int err;
> =20
> +	if (hba->use_pm_opp) {
> +		clk_freq =3D ufs_qcom_opp_freq_to_clk_freq(hba, freq, "core_clk_unipro=
");
> +		if (clk_freq) {
> +			cycles_in_1us =3D ceil(clk_freq, HZ_PER_MHZ);
> +			goto set_core_clk_ctrl;
> +		}
> +	}
> +
>  	list_for_each_entry(clki, head, list) {
>  		if (!IS_ERR_OR_NULL(clki->clk) &&
>  		    !strcmp(clki->name, "core_clk_unipro")) {
> -			if (!clki->max_freq)
> +			if (!clki->max_freq) {
>  				cycles_in_1us =3D 150; /* default for backwards compatibility */
> -			else if (freq =3D=3D ULONG_MAX)
> +				break;
> +			}
> +
> +			if (freq =3D=3D ULONG_MAX) {
>  				cycles_in_1us =3D ceil(clki->max_freq, HZ_PER_MHZ);
> -			else
> -				cycles_in_1us =3D ceil(freq, HZ_PER_MHZ);
> +				break;
> +			}
> =20
> +			if (is_scale_up)
> +				cycles_in_1us =3D ceil(clki->max_freq, HZ_PER_MHZ);
> +			else
> +				cycles_in_1us =3D ceil(clk_get_rate(clki->clk), HZ_PER_MHZ);
>  			break;
>  		}
>  	}
> =20
> +set_core_clk_ctrl:
>  	err =3D ufshcd_dme_get(hba,
>  			    UIC_ARG_MIB(DME_VS_CORE_CLK_CTRL),
>  			    &core_clk_ctrl_reg);
> @@ -1479,7 +1498,7 @@ static int ufs_qcom_clk_scale_up_pre_change(struct =
ufs_hba *hba, unsigned long f
>  		return ret;
>  	}
>  	/* set unipro core clock attributes and clear clock divider */
> -	return ufs_qcom_set_core_clk_ctrl(hba, freq);
> +	return ufs_qcom_set_core_clk_ctrl(hba, true, freq);
>  }
> =20
>  static int ufs_qcom_clk_scale_up_post_change(struct ufs_hba *hba)
> @@ -1511,7 +1530,7 @@ static int ufs_qcom_clk_scale_down_pre_change(struc=
t ufs_hba *hba)
>  static int ufs_qcom_clk_scale_down_post_change(struct ufs_hba *hba, unsi=
gned long freq)
>  {
>  	/* set unipro core clock attributes and clear clock divider */
> -	return ufs_qcom_set_core_clk_ctrl(hba, freq);
> +	return ufs_qcom_set_core_clk_ctrl(hba, false, freq);
>  }
> =20
>  static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
> @@ -2081,11 +2100,53 @@ static int ufs_qcom_config_esi(struct ufs_hba *hb=
a)
>  	return ret;
>  }
> =20
> +static unsigned long ufs_qcom_opp_freq_to_clk_freq(struct ufs_hba *hba,
> +												   unsigned long freq, char *name)
> +{
> +	struct ufs_clk_info *clki;
> +	struct dev_pm_opp *opp;
> +	unsigned long clk_freq;
> +	int idx =3D 0;
> +	bool found =3D false;
> +
> +	opp =3D dev_pm_opp_find_freq_exact_indexed(hba->dev, freq, 0, true);
> +	if (IS_ERR(opp)) {
> +		dev_err(hba->dev, "Failed to find OPP for exact frequency %lu\n", freq=
);

I'm hitting this print on bootup:

[    0.512515] ufshcd-qcom 1d84000.ufshc: Failed to find OPP for exact freq=
uency 18446744073709551615
[    0.512571] ufshcd-qcom 1d84000.ufshc: Failed to find OPP for exact freq=
uency 18446744073709551615

Doesn't look like it's intended? The number is (2^64 - 1)

Regards
Luca

> +		return 0;
> +	}
> +
> +	list_for_each_entry(clki, &hba->clk_list_head, list) {
> +		if (!strcmp(clki->name, name)) {
> +			found =3D true;
> +			break;
> +		}
> +
> +		idx++;
> +	}
> +
> +	if (!found) {
> +		dev_err(hba->dev, "Failed to find clock '%s' in clk list\n", name);
> +		dev_pm_opp_put(opp);
> +		return 0;
> +	}
> +
> +	clk_freq =3D dev_pm_opp_get_freq_indexed(opp, idx);
> +
> +	dev_pm_opp_put(opp);
> +
> +	return clk_freq;
> +}
> +
>  static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned lon=
g freq)
>  {
>  	u32 gear =3D 0;
> +	unsigned long unipro_freq;
> +
> +	if (!hba->use_pm_opp)
> +		return gear;
> =20
> -	switch (freq) {
> +	unipro_freq =3D ufs_qcom_opp_freq_to_clk_freq(hba, freq, "core_clk_unip=
ro");
> +	switch (unipro_freq) {
>  	case 403000000:
>  		gear =3D UFS_HS_G5;
>  		break;

