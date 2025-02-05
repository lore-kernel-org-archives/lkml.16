Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B121821D5AD
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755912; cv=none; b=fR6s8jcfPOGX46P6VaZ4yTAS+j7VHgUnnsMTK9OFHgyIRe/f1SQuWcQXKvIlasf+bkqj+8Df0gKXFCCcm2w9Er6yBINrAR4NhYiamcfA+lRYKWBsosMoRuoYM4uT3Rqw9o0SoXtvya2gt6KZTrq+Pg856uVbpVDMonwBEBLb7cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755912; c=relaxed/simple;
	bh=oZAxtVET1wE2jhM9j8X99IZJQPcTavMHE2/2pQ3Gvdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tqOUdKQK9eFbFQyxO+EUBBePXRYqShWK3UmWTjDiBaO4XwKYd7H09MS04hWFzxm2bB3U5rdcDE7kuMJoa7jEXpyZcaMdqud3HvZkF2ExuftdX+RAHxYfNnS+PWlxfvgXFrtSPZNc+S6cTRkXLIffeCMW9mDEHXYEKL51jAFWfoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I7O0dLY/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I7O0dLY/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so66179795e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 03:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738755909; x=1739360709; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=krjyMR76l7n+8MIJbB1GUtKwk+G5MPaqLtVtT5uYKhc=;
        b=I7O0dLY/oiibeO4CB2TEdbN/OwOmOQEtbqQabo+PTzROnA2Y+dn+uZaFyoOvPWXLN+
         m+secgEJIVUwfSEk/SyMX12oEUeELeMtmWnyU2x0EF0Nou0ZgCrBqYQH3gSNuD+Woxut
         s3YIAGcJKsneq181rpczGw8YxokU7445jzLrR5FLoaV0q5i5tjl88j/TScuGYArWx3bo
         EBMVyaiiaonZhjCZPd/2ol+DDp0xbOk3yPwCUQ/hix2AjSPb5HJeU4Q9NAl/DOnEt9ls
         MUo/StOCbyAu/k1DZHC+zf5hsDtSGG0dSkTK4B8Zzc/76d4W7+L6MN/Y/FrLnuUeeuWX
         GbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738755909; x=1739360709;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krjyMR76l7n+8MIJbB1GUtKwk+G5MPaqLtVtT5uYKhc=;
        b=ANfgYho9KV/r4PiGth5NddJiqBVtmIONfHFH8DRc2qmhhwA1Tb97JqAX78GH1krLQI
         +UXnHHA47oMtHDt4PRqOLrj2UZC5zc1QKSHaozlfT3rftnT4ju6a21WBvtc408hMeHKB
         /pRJ7S3HuMP1XfAPDRd/O35Bk8NGSFdcvPstMEHUYsPLHVhca5lOs24GaiWhrmCO3t2K
         kIRe8ykuVBGq8qjU68i5WdZ3zqA2W7GhwKhN/qH9PZb1f67AgCLYTKbm4NCT/Jef6gwz
         5of0JOWZYAI0C8Z4PrXvVjDAgk9G+KmwYAQKTkZNcJiy6mXakZQqhDxzsw4F3a5OaqtS
         foWA==
X-Forwarded-Encrypted: i=1; AJvYcCXbW6OrxXJqcwElbtRNXQFIP3SYcGxOD7U8g6CWPe0mfrai/v6W2ffjEAT5fJ9f0hKdU6vygAsCp03aWEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDUZtElFuZNAbaX5S6hSoInHf2cDEmfRORfxXcc5iLN7cBE9xs
	WvNzkjH1iCvqfVN/d6hAl1eCsZ4KPxEdihNZNpwERx22sKYqnFKf5CeA8wuhnd4=
X-Gm-Gg: ASbGncsbP1N/nT0K+gydZq0ToZH2+xrXRn68eNSE5cDuQt9TSMLCgN475jFZxh507He
	419eqKo5omsAAG0JI/9wCNOKTgsVG0Zl6KDxGoZ5C2ihE279JNMZYpZhBjJ/3JjOhSBCsg1xlru
	SvDP7s+q+EuPvdIOw7DfWyHLDnIq4MOLvF4fZLG8UJvpVldRBjn2YBjohoLOFC9pL5ZBobnUfIx
	kGsmu6cTuOCQFCY0uJm30BbvbkD31MFSbyh7fD0Lq5p5+LpFdh2M/3vaS3vHol20/SWdhfzXVdw
	uIeryc47iQp+SnY=
X-Google-Smtp-Source: AGHT+IH5pA9nFsDUrM2gX20oCMgcw6Ettml2LCsg79WrwVjRsFnTcF1E4WteE/R+Se3LQcwvW0qvVg==
X-Received: by 2002:a05:6000:1ac7:b0:385:ecdf:a30a with SMTP id ffacd0b85a97d-38db48e49e7mr1816903f8f.33.1738755908958;
        Wed, 05 Feb 2025 03:45:08 -0800 (PST)
Received: from [127.0.1.1] ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38db15f7712sm3004674f8f.49.2025.02.05.03.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 03:45:08 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 05 Feb 2025 13:45:05 +0200
Subject: [PATCH RFC] usb: typec: ucsi: Schedule connector worker on
 freezable workqueue
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEBPo2cC/x2NQQrCMBAAv1L27MIaKIReBR/gVTwk6cYuSqK71
 Iqlfzf0OAzMrGCswgZDt4LyR0xqaXA8dJCmUO6MMjYGR64nRz3OyQQtTTzOT8ZUS8Gl6oMVa8G
 szL8Qm1jemHKm4D1F8hFa76Wc5bu/rnA5n+C2bX8PVqPpgAAAAA==
X-Change-ID: 20250205-ucsi-schedule-conn-worker-on-freezable-wq-cff0a880b08b
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4279; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=oZAxtVET1wE2jhM9j8X99IZJQPcTavMHE2/2pQ3Gvdg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBno09CCRtR5Dy9bc/rIkazVE1mNit6USh9YXNtJ
 oD6jfCXcyeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ6NPQgAKCRAbX0TJAJUV
 Vt9nD/4w+He57MgwTdvrkVp36C2xPg/O4NazTm2AL5sAmMCHWow1b4tpoo19+zWgA4hQoOc97IS
 DBES7a1QBSotYb7F/gHjBW+Sz2WI18IcnauMBCW4YjklGiakJgf36h8NE9s85tRM/3cE1x0WHF/
 wrfDTUL5AMdj0hrSyS1GHWyjDRezBYId8BUSkiY489/waRLCq8Ma112k3iQTw8/K2/iceQX5dt2
 N2CuzwtAPcgGF99AdrqN1Yliicy77EjlWXO/S+GFnJDUhttBo1W8zbg/yRwayQtfFN8rx7butSD
 SHOTFZMCeZUz6+h4Y9aneXKNebLRDpjzvpVK9zzRHdAoqSEyEZ/6lgU0zM1RUeIrj4udlT4/1JQ
 pD3G8JhoPwAyKVOqRc8UByzWp142HN9jJ4DvBB63797pGj5gP2Upr16zc6p0OXIg5DqWlBCe4ES
 jM1o/ArCWlILzhWBFoSC2Q+1a0JCCbYrsFtcvUjohKp+DOnWUXv6moP8A40h1GWyTBW3GeHEaWE
 sixdYNLhe6CQRARMBy7fKS8lyttXcv2ExTpuYm+h4iq+Qm8369w6GsV7JHH8Jd+ZvouX0iSepyh
 PvPikb8YR6kE/6susty9FTGnmk7WicPHnYyclyZI/Bp65ryhoCxux1jJ9C2baidZFsTtGtTztv+
 dW8ct+AQGpsnPlw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Currently, the UCSI connector worker is scheduled on the non-freezable
system workqueue. During system suspend, on a plug/unplug event, the
worker can run before the devices have actually resumed. The UCSI
instances can implement operations that might need to do some HW accesses
while the devices are still suspended.

Scheduling the USCI connector worker on the freezable system workqueue
instead will ensure the devices are resumed by the time the worker is
scheduled to run.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Sending this as an RFC since I'm not really sure if this should be done
in the ucsi generic implementation or in the pmic glink UCSI instance.

For context, on some Qualcomm Snapdragon X Elite laptops, there are some
i2c interfaced USB Type-C retimers (ParadeTech PS8830) that need to be
configured on each plug/unplug event. Since the i2c controller is
suspended when the UCSI connector worker gets scheduled, it results in
the following:

[   70.036669] i2c i2c-4: Transfer while suspended
[   70.036802] WARNING: CPU: 0 PID: 819 at drivers/i2c/i2c-core.h:56 __i2c_transfer+0xb4/0x57c [i2c_core]
[   70.036945] CPU: 0 UID: 0 PID: 819 Comm: kworker/0:4 Tainted: G        W          6.13.0+ #84
[   70.036949] Tainted: [W]=WARN
[   70.036950] Hardware name: LENOVO 21N10007UK/21N10007UK, BIOS N42ET85W (2.15 ) 11/22/2024
[   70.036952] Workqueue: events ucsi_handle_connector_change [typec_ucsi]
[   70.036959] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[   70.036961] pc : __i2c_transfer+0xb4/0x57c [i2c_core]
[   70.036963] lr : __i2c_transfer+0xb0/0x57c [i2c_core]
[   70.036964] sp : ffff800082ffba90
[   70.036966] x29: ffff800082ffba90 x28: 0000000000000000 x27: ffff1cc400dba0a0
[   70.036969] x26: 0000000000000000 x25: ffff1cc4034bd500 x24: ffff1cc400010005
[   70.036970] x23: 0000000000000000 x22: ffff1cc400dba0a1 x21: 0000000000000001
[   70.036972] x20: ffff1cc4011ab0f0 x19: ffff1cc4011ab160 x18: 000000000009eb8a
[   70.036974] x17: 00000005bf44b304 x16: 00000000000000cc x15: 0000000000000004
[   70.036976] x14: ffffde65ecd46798 x13: 0000000000000fff x12: 0000000000000003
[   70.036978] x11: ffff3e658f1f7000 x10: 00000000ffffffff x9 : 340eced73efb4000
[   70.036980] x8 : 340eced73efb4000 x7 : 656c696877207265 x6 : 66736e617254203a
[   70.036982] x5 : ffffde65ece89084 x4 : ffffde65c9120093 x3 : 0000000000000000
[   70.036984] x2 : ffff800082ffb854 x1 : 00000000000000c0 x0 : 00000000ffffff94
[   70.036987] Call trace:
[   70.036989]  __i2c_transfer+0xb4/0x57c [i2c_core] (P)
[   70.036994]  i2c_transfer+0x98/0xf0 [i2c_core]
[   70.036995]  i2c_transfer_buffer_flags+0x54/0x88 [i2c_core]
[   70.036997]  regmap_i2c_write+0x20/0x48 [regmap_i2c]
[   70.037001]  _regmap_raw_write_impl+0x780/0x944
[   70.037012]  _regmap_bus_raw_write+0x60/0x7c
[   70.037014]  _regmap_write+0x134/0x184
[   70.037016]  regmap_write+0x54/0x78
[   70.037018]  ps883x_set+0x58/0xec [ps883x]
[   70.037021]  ps883x_sw_set+0x60/0x84 [ps883x]
[   70.037022]  typec_switch_set+0x48/0x74 [typec]
[   70.037026]  typec_set_orientation+0x24/0x6c [typec]
[   70.037027]  pmic_glink_ucsi_connector_status+0x30/0x7c [ucsi_glink]
[   70.037032]  ucsi_handle_connector_change+0x98/0x614 [typec_ucsi]
[   70.037034]  process_scheduled_works+0x1a0/0x2d0
[   70.037045]  worker_thread+0x2a8/0x3c8
[   70.037046]  kthread+0xfc/0x184
[   70.037048]  ret_from_fork+0x10/0x20
---
 drivers/usb/typec/ucsi/ucsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index fcf499cc9458c0d12015a7e36e5f1ac448c3a431..8c6081e0cd6155a59ca733070cd93e6b79398b3e 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1307,7 +1307,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num)
 	}
 
 	if (!test_and_set_bit(EVENT_PENDING, &ucsi->flags))
-		schedule_work(&con->work);
+		queue_work(system_freezable_wq, &con->work);
 }
 EXPORT_SYMBOL_GPL(ucsi_connector_change);
 

---
base-commit: 00f3246adeeacbda0bd0b303604e46eb59c32e6e
change-id: 20250205-ucsi-schedule-conn-worker-on-freezable-wq-cff0a880b08b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

