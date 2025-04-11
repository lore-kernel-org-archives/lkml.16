Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B00127E18
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377063; cv=none; b=dA0H93uOwy9b7+KjYRopdKGJSvEo+1ug1U7gzDPZaFv+lAO/G4X/eu9pz1uNg5+L0aKchCdR/vR4uvRllZSsVVQguHOlTxrki6e5xM13ID/Pb2t5YuerLoHTQdq/pvvSIvtaOkBlduml5IiE3XGaU6da6iJkNZmTDJ84YDtd7aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377063; c=relaxed/simple;
	bh=KNGCI8iZbv3kf8bnxoKogqaCv17e2RUy4yd6YkWujZA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QDI9Gc/F6ZH+S32mZBb/ueVWqDjsgt9tmzRJoRk9dIHM8PYQHmLQfgaO8vqFn92SiXgwmRQ401eVMN2GgAk4BiZpfAfcra/90ZMtoHeubE1oMxNU1Sud0XfS5YqIEQ0lXUgX9uC7E7zNCFoDZ3rgSmS4aLlZoO1Ro6vttXh/pg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=uDcX1KRh; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="uDcX1KRh"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d5e68418b5so15618165ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744377060; x=1744981860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VYCCFDFCEobLrI5Q5CedJLQFdsKndUH1aW4lMsa02A=;
        b=uDcX1KRh9XWzbuKFwM84w61M8odH90C03mGfDQlVr05vU7YN2MOULLAKrGfem065vC
         w7xdBLseL+IbePgX2FmQPB16eH63ras4hb5Dsn8AAYYpPvZNzD7egOSvFIWBP1ZpKIq7
         nBR2OR/DLgKskpZBXhlTMimdar4W09H80JNM3mJoLbY0yb9NcmcVlva1JDtiIUNBD8WO
         ILHPGhm2pj4kw1lOMMh0z53KJK6GFOOkGPu3uAwLT97oznWa63iECHR57tdaHzYx6jy4
         PZ3BjQnjVZukvLsMcpQsEImpV1b3/X7br7WPST3l2jw8Fp1LBQA2utN4h/y8XJx76WbA
         Y9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377060; x=1744981860;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VYCCFDFCEobLrI5Q5CedJLQFdsKndUH1aW4lMsa02A=;
        b=VOGthKsbJwG8b9Js8yofFITFHIofiHcCyuiiUYGl75N7MuJwt0amjpjlh20V4Df5dU
         dQpB9lBauAWEoBCvCyoMesofm20boGiZaIeMCwtQj3Mc9uZrSjPPDWYhTrBZ7L/LM8mQ
         8Kk8fNWeoGBphVvyXf/Sdp1GbzD7f8LnSgF/VhnHlaWrINtfElcXydVSk0k0oDFF0rOT
         3Cxc3C1jUIFB/zL7y81M85y7ozKQDLopsSpcudv9uX9LVMDw6uviIUYQjvT0baon8tWY
         Hl5E/Y/UAfVOSBK5rpBkB6iyTA3x9s7xhp+5XfPaA6ZC4yu3i2zz3/sn3s48zInO2Fny
         oTWA==
X-Forwarded-Encrypted: i=1; AJvYcCVnPAIqtFVsLUxb09hIG86+00Osabh1NyhJBrLvv3uFxhc1RfGW+h0Gba7H2PKrPq9b6nWf1nRcCdf50Rc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ydRN8ya3CGdCqScHrtxb8am6CLVmvkJMges/ePtpmPCY+5du
	NR2en+tMq20/6xpZoSUT+gMNtabjfg4EOFcgcbzaSXQjEzUE5To+hM/DqwH44ErrV2GI6Qz1oi+
	p
X-Gm-Gg: ASbGncuxxgDQjt86HcxU95UY04Yzgzg1Q1gZ1cBMoiMxaQsr35JMJHru+MvV7KvGACy
	eTcVg0Ha69Gq5esXPYDlcqLtPuqqZxfhfkKf1Bb2Brrkpv5Sqkf8MotAQcvWcA/dWaz8mhGe695
	nmdi2S5W56aYMHbn+W5OZrbln11/QYsVJtz1dhPi1xTQnSKbEuLKNbOEjQusLTyP0CfgxTwGoSb
	nHoIzQ6oq25lqBkMfnpo58sVA95oTGtwTM8CEt+ziWs4hYuzt9NLk+Ow3FOD/QwBLwfLi2apXpe
	gueGET0hGikfW1QTSYqVDQbMbLg1xBc=
X-Google-Smtp-Source: AGHT+IHRPHHm/x8hR/BdRBXqozk1Hoq9zXRS7ajeSoflTc7+Z07HXq3A94C+WG1ptgrg7TxO3RzbTQ==
X-Received: by 2002:a05:6e02:1a44:b0:3d4:6ef6:7c70 with SMTP id e9e14a558f8ab-3d7ec27332emr31256455ab.21.1744377059869;
        Fri, 11 Apr 2025 06:10:59 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e2e610sm1208191173.108.2025.04.11.06.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:10:58 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <ming.lei@redhat.com>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250409012928.3527198-1-csander@purestorage.com>
References: <20250409012928.3527198-1-csander@purestorage.com>
Subject: Re: [PATCH] ublk: pass ublksrv_ctrl_cmd * instead of io_uring_cmd
 *
Message-Id: <174437705869.412953.4991177928671177671.b4-ty@kernel.dk>
Date: Fri, 11 Apr 2025 07:10:58 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Tue, 08 Apr 2025 19:29:26 -0600, Caleb Sander Mateos wrote:
> The ublk_ctrl_*() handlers all take struct io_uring_cmd *cmd but only
> use it to get struct ublksrv_ctrl_cmd *header from the io_uring SQE.
> Since the caller ublk_ctrl_uring_cmd() has already computed header, pass
> it instead of cmd.
> 
> 

Applied, thanks!

[1/1] ublk: pass ublksrv_ctrl_cmd * instead of io_uring_cmd *
      commit: 843c6cec1af85f05971b7baf3704801895e77d76

Best regards,
-- 
Jens Axboe



