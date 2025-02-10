Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE14724CEEF
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739228545; cv=none; b=l5cBtafArOmeqqWEs+se6BykTP0QfY6sJzNIzqUgsRe2ishTH60RRg+WLk90buSZtpHlJ9RurG3BiNEwSW5T23x67nCU1mf7hgYn4VXdErH5H3O7YaRUe6U6ROqitzCjK8cOe6BUV4pTBGtC6lOtLm/WRXXxa+q4IEo3D2mMRdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739228545; c=relaxed/simple;
	bh=ny+ATBmbR1SyGAk+gxoXGyW0CLZLmrmFUn/0KjsvVzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EBfcP7lFvjp/Wzcn8VaYoPIyFmVYnNI2olP8mk0fVbhMK43dzJ/e0f7crnnv4LvA0XNpVLEBTT5l95UT3/TQomDsBzbNoVaVaXCru2yHEe4ke+LVh44hGc4zME8KKr7zbqNTTlfbVITKyiOfEzg7+x8dnibvT0U52HwX8548Q6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t/MiSNjM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t/MiSNjM"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f74c4e586so43291225ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739228543; x=1739833343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/f3RPwfSA1e5eBKwDy2dScoEFSvk94d+X9rymYjEPPw=;
        b=t/MiSNjM08ZmLCMFqJwogu3mRQMZHdqrDziLqK/Jvh4aNuys5beN/P0DxgPTYriHAp
         1D9Uuwf9zZZkGdQxly8uQ+zJeRdxxKHqT0dBwKdzIEeCVALChcqv6Erc3U+KHry4a4L5
         GDEEpbpnJ7lD2blq13lcjBWRwix0QI6jJcmX66rl27Np5ZHtfAMzqq1i0ZPkZD8GvQRC
         eoWg/5pEMtGf4tNfbPK4Lhl5mfhoz6SlUU4vqYrMkF3oG2UHWR28PZ4odWiES/QGBuMb
         LloW2LdjRBVDzdTF4sBlzWng7IUx6IXOUgFSjvStS7sAUdxiramP31ZVuLAOKTsMyjrt
         fscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739228543; x=1739833343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/f3RPwfSA1e5eBKwDy2dScoEFSvk94d+X9rymYjEPPw=;
        b=P0PVZ+qa0WUhOu6M9ZY0ac1Sld1zrkKenwb2xATt+FIwACF9KuM8eYxmX0GhE9sS7e
         IzkiUMVULKi9gnEcuXn0wTjytnu5LvalOsX7mEwaNWvu1VTRjNEtGQy08k+z43uAaaqO
         qHAtI4zw58oCfR1wjkGix/iTd8+DmT7Pk5uleeKKbQnSLqwSd6MLmE/ycsXGsRYJ2iKI
         7Ky7q5M2lPyKIw45TbIUo2tdgSDFPkNR9KY28yE3iV7ULBOzqYBJKHh1uCZVJacgU7IE
         sXCPvbnywfeuils4whFzVWiCiBw6IAf7tkke4JnJYoQ/mOeNbjNgFNuymRqvss4VuWF/
         E7VA==
X-Forwarded-Encrypted: i=1; AJvYcCUsUitYhZu0LktdjCFzmHowQcLdUP+jpy2IRtw0P8eFixq+JjsCgqoOkADicHQwxt7OKay0POPpxsWPNjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyGlcP8oR0dhn0XQO+dRsM8EtOt/jmgaBX6UdXDSJVLU0fET3H
	rL5LOLzhvU7m3Y4n1RKVGFAHY4YXpVlZrTNz4o/E14x5a4uecr0GEoKrBnFDEw==
X-Gm-Gg: ASbGncu1X790gkDZ6pwsaDt8l6/E6xw1AuSOq0Pjl7W4mB9NaWRRP8xWEDYoP9g6GGu
	K7pDx6u4Zi3tqTheqeD3wPw/Gor258GF27ZP1B7N5Bn4fKb3tH/PR9AkzCMhfzeAPVQg/GDEbzL
	aiKpSnx0prfabyiba6GVx076SZtcrFLFmcn3xLcpYyqTzQkyz3HlsN2KD/O/GvMogC+MydFD9eT
	Rv5R3o3BTzUQcGUUmjKYhODLOQq6BP2PKilms0qL+RckNR4PzJEgi6sJanHbuHCo3TAV0tOYh/N
	RYN2d8SXyjGT8640/6M4GNMFScznBXyRhkOBTZVpvb/XiucpPEpGWZjVf1OmfrXSyvgNShL9CcP
	oiY+U3KNM+kE=
X-Google-Smtp-Source: AGHT+IEzON8gBhYVw1w+QU6wxSLAM5KlmTQpmu2/n9ZYhrWUoHxKyS3zCZeDf3jaJy/UIfaYUlpNyA==
X-Received: by 2002:a17:903:41d2:b0:215:a028:4ed with SMTP id d9443c01a7336-21fb641d210mr17516885ad.20.1739228542783;
        Mon, 10 Feb 2025 15:02:22 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e14:7:85e1:17d8:711:faf4? ([2a00:79e0:2e14:7:85e1:17d8:711:faf4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa4d1220f2sm5260861a91.40.2025.02.10.15.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 15:02:22 -0800 (PST)
Message-ID: <5d504702-270f-4227-afd6-a41814c905e3@google.com>
Date: Mon, 10 Feb 2025 15:02:20 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] usb: typec: tcpm: PSSourceOffTimer timeout in PR_Swap
 enters ERROR_RECOVERY
To: joswang <joswang1221@gmail.com>, heikki.krogerus@linux.intel.com,
 badhri@google.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jos Wang <joswang@lenovo.com>,
 stable@vger.kernel.org
References: <20250209071752.69530-1-joswang1221@gmail.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20250209071752.69530-1-joswang1221@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/8/25 11:17 PM, joswang wrote:
> From: Jos Wang <joswang@lenovo.com>
>
> As PD2.0 spec ("6.5.6.2 PSSourceOffTimer")，the PSSourceOffTimer is
> used by the Policy Engine in Dual-Role Power device that is currently
> acting as a Sink to timeout on a PS_RDY Message during a Power Role
> Swap sequence. This condition leads to a Hard Reset for USB Type-A and
> Type-B Plugs and Error Recovery for Type-C plugs and return to USB
> Default Operation.
>
> Therefore, after PSSourceOffTimer timeout, the tcpm state machine should
> switch from PR_SWAP_SNK_SRC_SINK_OFF to ERROR_RECOVERY. This can also solve
> the test items in the USB power delivery compliance test:
> TEST.PD.PROT.SNK.12 PR_Swap – PSSourceOffTimer Timeout
>
> [1] https://usb.org/document-library/usb-power-delivery-compliance-test-specification-0/USB_PD3_CTS_Q4_2025_OR.zip
>
> Fixes: f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")
> Cc: stable@vger.kernel.org
>
> Signed-off-by: Jos Wang <joswang@lenovo.com>

Tested-by: Amit Sunil Dhamne <amitsd@google.com>


Regards,

Amit

> ---
>   drivers/usb/typec/tcpm/tcpm.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 47be450d2be3..6bf1a22c785a 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -5591,8 +5591,7 @@ static void run_state_machine(struct tcpm_port *port)
>   		tcpm_set_auto_vbus_discharge_threshold(port, TYPEC_PWR_MODE_USB,
>   						       port->pps_data.active, 0);
>   		tcpm_set_charge(port, false);
> -		tcpm_set_state(port, hard_reset_state(port),
> -			       port->timings.ps_src_off_time);
> +		tcpm_set_state(port, ERROR_RECOVERY, port->timings.ps_src_off_time);
>   		break;
>   	case PR_SWAP_SNK_SRC_SOURCE_ON:
>   		tcpm_enable_auto_vbus_discharge(port, true);
