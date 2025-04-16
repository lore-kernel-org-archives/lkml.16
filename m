Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213B71FCCEB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765185; cv=none; b=Dsz7X0B+oqKzGVlrvb1z9Rgx+prPJLa2TPf0DON6hNGSt8kVn1idSWlcA/486nVXDDhGaiLBAwfB4izhK6bch6+1UrC5ZxUMsnG64wUhIZ6hzcKvBMiH6bGSUfkX9vEBXNY1yXv3G/lu1tpRpjRan/8rnONB3Mnbr8EvejM53bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765185; c=relaxed/simple;
	bh=lEGP9mD7MvUcXDYdqhzYIQGHZMKWftllVNmBTxlRu8E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ahXK0B9Xnvalw7VGkxOLct7o7nc5zHboLsUn9kERsquYunIwzGtzPQdHQxEeTdH2QsrVnJHcQdgHBmpj3BVyJCA1cW7yCSraCqhcnK6zeekGijgdmp8dTBu2mF2uTCKVs/G0pQJk8yQw4xiJGnEBoQmhrrMW0Sz4Woc+Z1vWozQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=eAyIsJ8w; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="eAyIsJ8w"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-85d9a87660fso518216439f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744765182; x=1745369982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1FE2zVZmKw/thcJ104wwO6SRP1SEiJsFxUW9ObMIY4=;
        b=eAyIsJ8wS4vG1hnrsdcSWviidMwQRPYzGPRlQwMaOnJt9p3dxtoRhwiahrseunP0s9
         G07Gu885lNmyuayxhF8tQ4H5pRGtMdmhB2fF9KXTbwuXB5odpmDI7qUHeGjwf8KsWG3B
         kIBOOrJxmftEJlPn3dMvxZKs5DHjGzM/eUhqw+VXNVnQMKvtdnJsJFWTB1ic25RSH8b0
         DiMx0R2xpcKQojzh/tg5vX9bOmTkzYjq7q38A8O7Z9KE5KG11iUdG/eLg3fLNUwRJoNw
         gryBX0SiLTqhqrr+FpxwDTtxISF0lCJXo7thkXAwHJcnI3KFh2JCf2pmFvMN+WZ+EShb
         sq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765182; x=1745369982;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1FE2zVZmKw/thcJ104wwO6SRP1SEiJsFxUW9ObMIY4=;
        b=fj5HjVyctqDANvCNshSPHunvxpAc38W4h+OSrbanJt3TXKoUXnwdAlv47Sq8fXUOEJ
         0Nl1yRrDUopZiamvWTZJ3oSUBJrzI6jzo4y9+zyjTGTKjEQRJaMVPjlzroxcVU7UlLYa
         9se855pD5BusKRnGSiJ2gTspRofhyrbec9vn/iINNS3QINSaaGIN30c+X7DY6ZwtFbRD
         MhTvoYXFjnX/TlX/xzoZsWgTKnL/IQctAbmGzFHuQgYznEC382dd2Axe70EiojcFrLpm
         q2BFFWue74obHNyqjyXTNejd1WtfckrMrt7xsX9XFVMgjPEmVvnEtByj0xQDm7yJbuUL
         NI9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUU5Pr73d9JQ8M9ztjp0MMyWwGU2fLDRYFkIcIGfjhHfW+uHqjm2xbxO24FoJUTQQgP1jcZM4ECS0vpK30=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpnqUMnth/QLAwkFXR0B87aVT28l63Q93el1x+Be1Es0Pxt/JM
	AcW+e1U5Z53RhDzbCLFLcA13ln6qsGRddsjlexGOxMLWArjRrwCpkOqZzEGvzNQ=
X-Gm-Gg: ASbGncvkpbH9Q0sQwiAeTLE+rYeR3Gub34j8uCyGjK8yI/V2dddEgZy72RFXs9+ABlS
	KvpAIclGq5oe5wNNoZCgAYbo/VDhEUay4IQyeVtCIuieR4JBB3bSstjPDmxOsPjETvsvnCr3vPm
	pfGHTOKzvOIed87cJFoImwp5PmXSSpYxtFUzNXfmUTRpRDmrPUkUL/WO+TPnRzaCfRFfK52mS7x
	HCOHAwLn8/GiaJDcozvNiBgG9yV2VnpDe1PQJ6SBqG4P4CQv6gjI49eaOJP6XHsA3QWVmENworW
	1bw0n1/w9tzvoWFhOvBCwhdHvODDVVni
X-Google-Smtp-Source: AGHT+IENdPZ5RCxBLNEPTCBRVUprVLI/YIgbzhf1//lZ6SnwHZmdl3X+uIAKaxkTXsVSbRXMnJ/w/g==
X-Received: by 2002:a05:6602:7215:b0:85b:43a3:66ad with SMTP id ca18e2360f4ac-861bfc4be77mr177425539f.8.1744765182314;
        Tue, 15 Apr 2025 17:59:42 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8616522c958sm275458039f.6.2025.04.15.17.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 17:59:41 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Uday Shankar <ushankar@purestorage.com>, Ming Lei <ming.lei@redhat.com>, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250416004111.3242817-1-csander@purestorage.com>
References: <20250416004111.3242817-1-csander@purestorage.com>
Subject: Re: [PATCH] ublk: don't suggest CONFIG_BLK_DEV_UBLK=Y
Message-Id: <174476518098.250948.15142433690972812108.b4-ty@kernel.dk>
Date: Tue, 15 Apr 2025 18:59:40 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Tue, 15 Apr 2025 18:41:10 -0600, Caleb Sander Mateos wrote:
> The CONFIG_BLK_DEV_UBLK help text suggests setting the config option to
> Y so task_work_add() can be used to dispatch I/O, improving performance.
> However, this mechanism was removed in commit 29dc5d06613f2 ("ublk: kill
> queuing request by task_work_add"). So remove this paragraph from the
> config help text.
> 
> 
> [...]

Applied, thanks!

[1/1] ublk: don't suggest CONFIG_BLK_DEV_UBLK=Y
      commit: 0b7a4817756c7906d0a8112c953ce88d7cd8d4c6

Best regards,
-- 
Jens Axboe



