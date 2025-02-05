Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B67C8C7
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 17:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738776698; cv=none; b=oZvDeexId1kIJgMYthmxmbl5vBXuKronsOoNlm8X6NjvwT7ds79Ov7fIFLSyfl9ZobjanaGENaciZdnWrsfOtFW55v3+WFO/tIsocC/mc7eRaCWdscv1PsUejBwL2Fm9aK5BbunBPHJkmf2zMaCrYy0szP0xfMEeoFN7ZZeK/sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738776698; c=relaxed/simple;
	bh=NqTUAAEFp6LCGLFoYYDg4Jk0+E7HrDFOEIiuZobX9zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvAYv7Hst5Piu2c74zsITkiEXC9FdjV/dWgfwaywbOPHYYKqOQNpreigVoHlcmRx5Ot6e0rxcbSGBOGPUco3+JzEtxRSiPqKdOsjEWw3OKJ6iW3M3LVZeRqd8ou0RPJ0dDCE3KdvKVh/99Do+QGuYKKgOKV9GkJ4W48l3z3Z+mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uJbRczqj; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uJbRczqj"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso984467e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 09:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738776694; x=1739381494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sSvDNu1MCew5DfKQuJ6rL3D/rzZSEMNFaxV9DoXqmfY=;
        b=uJbRczqjb64cRXChWq44Eqwg9MES4attp1ToxfcvnTI+yFlwMRz52mXK598jMFsPTo
         17zWis5hOuFQsvvOf6lRpYhZF0Fue15HusXKIItwjDcL9pRP8WbPoboU639Xi1/xljDK
         WyHLwB3bQjANh403QTpZthn3qiIKZrSdYZmulvGA8L9MfDGIsUbPyaHj4pmmT5VL/vMT
         C8ZtVjXpOTTKfwA/NHxx0MRNPUZ40AQncpzpZjnh5EITqSS+lWsu1/lAF8KKU45K3pl1
         ZDoPNgYuQinAmwbxvXAKLpxQVr1SgUqL7oShsBCb8RKaZPr/aJ2JVaJ1ttJmG32kxg4m
         7Vhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738776694; x=1739381494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSvDNu1MCew5DfKQuJ6rL3D/rzZSEMNFaxV9DoXqmfY=;
        b=r1DMF6RxtgC3MKl7IVZSRObP5kvtad+sRvk3g3rkCP3EQd9/UywaJB+W+FEB58UuYS
         epQ+RBDrPF2tuNjjzY9MgM8pZEfUaCl4skClXYbLRlt54UnQ6SPPy9eYPjwpBBhaaMiz
         5UMO97YLVUCZC5mitMU447BEAcLNqKZYTaDJFHBn6kkreFE48scAvGdh8QRx5AND6aL0
         opfZx8tuzQbnv3ghXDk93yQwlXxelkXECWcqvGTbHiKKrIGOb26MGRqcdSjoLZ1vKuw2
         XCO4GRqEe7F9y1kW+MqxLh8MFPLTbeWzj6/6pWMNoWNJt8xLbnZ+M8dHhJrDQDikbZx5
         AyPw==
X-Forwarded-Encrypted: i=1; AJvYcCXgf2xnyIa278LryskgWudoelGoHfkyJUTaARH+z7G2Y3AZcmDVf+F9nbrUWtU3ETUesyFmtcvJNhhSrPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZxhjiEU6RjJtXXZAV/JtajCXJz/JeZmYzYVvJZfWgHsJSiK3E
	KX1Nj2jK0gal7E1z09aZxaJHBatDZ0wt5tnIbs1c1Hhcp1TKqnxiSLdxhVIse+A=
X-Gm-Gg: ASbGncu/jgvlwPczRDHwos7v1md9kRlws4mkU8a/yU72kIAchTmjmNbK1/ZTphuDTH+
	OZGvayxZTe9hU56BHNc3z6YAGw6hSKkcABIo9wEEllOqAURe6+nojFDnWrgiPiZqVFkM8C4Zjgm
	x1aZZasaNaxSWXNP43SlmS/mPJkvVouuety/BUQoUrpqL+hyLUzSJBtLEyk1qx7u8+llZNKx31T
	K7GvDRQu1CktspQ+nBA4G0sWP3fLlU+OEazdmDCWUnBqRKkzVKNPGeL+JceJb3auYIOYFiXceIK
	lDgj2M0jgJSga4ea5l8778Dj1jmYV+12G64PAM6PjhH0wumTMdBalWSQW8KrDmeLcw9Mdh8=
X-Google-Smtp-Source: AGHT+IGwZzXG8P5ItvYBjpw42srLjgats+UzbQEDy9fXS82L2MWijTKxDeeg+/LLcNpf7puXXABxKg==
X-Received: by 2002:ac2:5f66:0:b0:540:2fbb:22fe with SMTP id 2adb3069b0e04-5440e6b96aemr45907e87.26.1738776694065;
        Wed, 05 Feb 2025 09:31:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebe98esm1919998e87.216.2025.02.05.09.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 09:31:32 -0800 (PST)
Date: Wed, 5 Feb 2025 19:31:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>, 
	Johan Hovold <johan@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] usb: typec: ucsi: Schedule connector worker on
 freezable workqueue
Message-ID: <dp5ohy5piss7osycibuke7kwnfl5elnmc6gfvqgfh6mzzrldla@sru3ylzrtuea>
References: <20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org>

On Wed, Feb 05, 2025 at 01:45:05PM +0200, Abel Vesa wrote:
> Currently, the UCSI connector worker is scheduled on the non-freezable
> system workqueue. During system suspend, on a plug/unplug event, the
> worker can run before the devices have actually resumed. The UCSI
> instances can implement operations that might need to do some HW accesses
> while the devices are still suspended.
> 
> Scheduling the USCI connector worker on the freezable system workqueue
> instead will ensure the devices are resumed by the time the worker is
> scheduled to run.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Sending this as an RFC since I'm not really sure if this should be done
> in the ucsi generic implementation or in the pmic glink UCSI instance.

Can we really fix PMIC GLINK instead, please? Previously you were saying
that it for some reason has to be woken up earlier.

> 
> For context, on some Qualcomm Snapdragon X Elite laptops, there are some
> i2c interfaced USB Type-C retimers (ParadeTech PS8830) that need to be
> configured on each plug/unplug event. Since the i2c controller is
> suspended when the UCSI connector worker gets scheduled, it results in
> the following:
> 
> [   70.036669] i2c i2c-4: Transfer while suspended
> [   70.036802] WARNING: CPU: 0 PID: 819 at drivers/i2c/i2c-core.h:56 __i2c_transfer+0xb4/0x57c [i2c_core]
> [   70.036945] CPU: 0 UID: 0 PID: 819 Comm: kworker/0:4 Tainted: G        W          6.13.0+ #84
> [   70.036949] Tainted: [W]=WARN
> [   70.036950] Hardware name: LENOVO 21N10007UK/21N10007UK, BIOS N42ET85W (2.15 ) 11/22/2024
> [   70.036952] Workqueue: events ucsi_handle_connector_change [typec_ucsi]
> [   70.036959] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [   70.036961] pc : __i2c_transfer+0xb4/0x57c [i2c_core]
> [   70.036963] lr : __i2c_transfer+0xb0/0x57c [i2c_core]
> [   70.036964] sp : ffff800082ffba90
> [   70.036966] x29: ffff800082ffba90 x28: 0000000000000000 x27: ffff1cc400dba0a0
> [   70.036969] x26: 0000000000000000 x25: ffff1cc4034bd500 x24: ffff1cc400010005
> [   70.036970] x23: 0000000000000000 x22: ffff1cc400dba0a1 x21: 0000000000000001
> [   70.036972] x20: ffff1cc4011ab0f0 x19: ffff1cc4011ab160 x18: 000000000009eb8a
> [   70.036974] x17: 00000005bf44b304 x16: 00000000000000cc x15: 0000000000000004
> [   70.036976] x14: ffffde65ecd46798 x13: 0000000000000fff x12: 0000000000000003
> [   70.036978] x11: ffff3e658f1f7000 x10: 00000000ffffffff x9 : 340eced73efb4000
> [   70.036980] x8 : 340eced73efb4000 x7 : 656c696877207265 x6 : 66736e617254203a
> [   70.036982] x5 : ffffde65ece89084 x4 : ffffde65c9120093 x3 : 0000000000000000
> [   70.036984] x2 : ffff800082ffb854 x1 : 00000000000000c0 x0 : 00000000ffffff94
> [   70.036987] Call trace:
> [   70.036989]  __i2c_transfer+0xb4/0x57c [i2c_core] (P)
> [   70.036994]  i2c_transfer+0x98/0xf0 [i2c_core]
> [   70.036995]  i2c_transfer_buffer_flags+0x54/0x88 [i2c_core]
> [   70.036997]  regmap_i2c_write+0x20/0x48 [regmap_i2c]
> [   70.037001]  _regmap_raw_write_impl+0x780/0x944
> [   70.037012]  _regmap_bus_raw_write+0x60/0x7c
> [   70.037014]  _regmap_write+0x134/0x184
> [   70.037016]  regmap_write+0x54/0x78
> [   70.037018]  ps883x_set+0x58/0xec [ps883x]
> [   70.037021]  ps883x_sw_set+0x60/0x84 [ps883x]
> [   70.037022]  typec_switch_set+0x48/0x74 [typec]
> [   70.037026]  typec_set_orientation+0x24/0x6c [typec]
> [   70.037027]  pmic_glink_ucsi_connector_status+0x30/0x7c [ucsi_glink]
> [   70.037032]  ucsi_handle_connector_change+0x98/0x614 [typec_ucsi]
> [   70.037034]  process_scheduled_works+0x1a0/0x2d0
> [   70.037045]  worker_thread+0x2a8/0x3c8
> [   70.037046]  kthread+0xfc/0x184
> [   70.037048]  ret_from_fork+0x10/0x20
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index fcf499cc9458c0d12015a7e36e5f1ac448c3a431..8c6081e0cd6155a59ca733070cd93e6b79398b3e 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1307,7 +1307,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num)
>  	}
>  
>  	if (!test_and_set_bit(EVENT_PENDING, &ucsi->flags))
> -		schedule_work(&con->work);
> +		queue_work(system_freezable_wq, &con->work);
>  }
>  EXPORT_SYMBOL_GPL(ucsi_connector_change);
>  
> 
> ---
> base-commit: 00f3246adeeacbda0bd0b303604e46eb59c32e6e
> change-id: 20250205-ucsi-schedule-conn-worker-on-freezable-wq-cff0a880b08b
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

-- 
With best wishes
Dmitry
