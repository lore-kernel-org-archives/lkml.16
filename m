Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8912505AC
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739283310; cv=none; b=OXNm0hdvgLWkLvjA46jGjvd7IzlQrYyKFGwJxzEu2icpoTIcI9zYCJg+7QnVt+uCmwlhmNMsqFtYy6UZts+wwvtWu4SJrFpJSG4W4P+CFmwqWs6oH08ruWaBo2y3EvRfF5fF0MwmlPynUlMfGCbQ5buL0SmxzJYZxtFA8k1NqZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739283310; c=relaxed/simple;
	bh=q+Hs2SHkHkF6zcWiQ6yaGSdhUHx4qOoQaWem7F2T1U8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FcKwutmeW0TJrwi9Gn/aA9M8t8N/gpWqoRfxd37ReOaiSEQ672hFUQswSMWmPo2/2X+IHV1F+qyl2luTn3yL66l4rPWdbj67w2iDXfU1DS4wlQiLmRu7JXzkdmTeEHTQS7xfLmn2Ma0TcWtlru910C71UqHlb2M00yEFgLtllPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=D24ok9dW; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="D24ok9dW"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-855418e04e7so43526239f.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1739283306; x=1739888106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdzkzP8yo0lOt6RBy7UoV+VarQja9k3vyWPk7H80DfA=;
        b=D24ok9dWjBtn4w2E3l5wdlHRbynsl5OL2TfrhJJZaVwPWTw3DhsKyMPprUN4QJXrvI
         +GpR2BJZIovOsGyRMZYL4mPFS75ytZHKIZfKdltQILcEJcsQGM/B+AZptOY6nCpHqE4d
         0qNvyhlJXntvOOAgbNWu3TtAc2Kj1H7CRf0AZDdTZztKkXFENNKDS2tBer3dqLyrOvRq
         EPaG7yDzTM2JtMcb4+eh7ZJAUBIZWo20VG327imkQddSRTajinYP3KR1S9pxvrfx1Tgy
         TCtPppym29H2LVj9TpDeO8M6Jq3AK722obFuloXr7DMnn0NEk3Om5k/yx8net+Xeb5y3
         7BCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739283306; x=1739888106;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdzkzP8yo0lOt6RBy7UoV+VarQja9k3vyWPk7H80DfA=;
        b=i5XTmTdNpm8DpTfzKduw+Td3IGKm0+5UKxPCvPQZ6WfZxT+ZmKrUnfnzewyFI7Zs8d
         WxgrNwHKEF3WhCIH3ywU5ZD/2d+LLCwX7QsNj4oSXyjAlStuFimAmI024axVFSfpOma1
         4Oh/EIdAH7ssMFlc21tmBDUCggZ6nfXWl8MEf0+mlE/IgjpfcMTvDCUxlC2FG9dujPxY
         WhLEKk/2SWUaoGckA8Dv9KqnN5OpyUAX22UDMTCS1fd6qjVK64BHF1Jxkr9uq9HR9G8O
         qU1zQKw4Vh63N3SxooyKfQh2kwPNEnInve101mVMS5BQ8pHjoXJdaYJi6ipbJ1wBhmqQ
         jU2g==
X-Forwarded-Encrypted: i=1; AJvYcCV2RR2AKSF3+0vAvEmEUR08HCQlYqdN35vshbYJoO3JIYWS60XZU+vZguN3YBDf4n99yxaVcO4BwVyaHUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhW8QsI3Z1d0xEod/fD0qdU8R/f2wcDIwVINLzw8KAdnWloDjI
	Aqr0RsnUR4SaR/T943d9UI2TYBQH8OqFXCkoqvOKjtfyavrW7jb284Wwr/Yv6nY=
X-Gm-Gg: ASbGncuPujP/z4w+UCmmp+9AY2/x7DnN4j/vKDMPAMm+LG0wmDucg9i5RKMZZZdYAnH
	hMQHsDgQnmbLJTyIccI/vjYslOe8qbnoZIaY9BfNGaw6Blhd8WYJxPtziHX56r+oTL6I4LAaWtX
	vjXLe26aga8ntbfNI+Jur420E6dqNpfFOjEJ6+0ZQU5BAUPZXS9mQAeaocBlAO7Z17q7DCiBQMQ
	75WX1mI/5bkIKnt6bNKCGuht/Uv+geA7FWm3Rdz4h2PtpgZPFCDjIxuHgruZhWSfxa52GwkiPA5
	DBzR4Q==
X-Google-Smtp-Source: AGHT+IFKIGv8EDPyy/7bp1zDbh55ZpYoXpz+ZdE0e8eOPJfgRxWp3vIJRcSq5Rk09f6YtFHhhvtzeA==
X-Received: by 2002:a05:6e02:214b:b0:3cf:b3ab:584d with SMTP id e9e14a558f8ab-3d13de9fc27mr131337185ab.13.1739283306581;
        Tue, 11 Feb 2025 06:15:06 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d14f21094dsm18094365ab.67.2025.02.11.06.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:15:05 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Dan Schatzberg <schatzberg.dan@gmail.com>, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Zhaoyang Huang <huangzhaoyang@gmail.com>, 
 steve.kang@unisoc.com, "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
In-Reply-To: <20250207091942.3966756-1-zhaoyang.huang@unisoc.com>
References: <20250207091942.3966756-1-zhaoyang.huang@unisoc.com>
Subject: Re: [PATCH] driver: block: release the lo_work_lock before
 queue_work
Message-Id: <173928330541.90490.11671067114197076767.b4-ty@kernel.dk>
Date: Tue, 11 Feb 2025 07:15:05 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-14bd6


On Fri, 07 Feb 2025 17:19:42 +0800, zhaoyang.huang wrote:
> queue_work could spin on wq->cpu_pwq->pool->lock which could lead to
> concurrent loop_process_work failed on lo_work_lock contention and
> increase the request latency. Remove this combination by moving the
> lock release ahead of queue_work.
> 
> 

Applied, thanks!

[1/1] driver: block: release the lo_work_lock before queue_work
      commit: 3bee991f2b68175c828dc3f9c26367fe1827319a

Best regards,
-- 
Jens Axboe



