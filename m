Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867A3E545
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 19:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743190993; cv=none; b=rxIt7RZ9Gc5xv/k8K5wDJqRxTxdxl5CB9Ap59swPjep+YueOeIO+xe1S/aMPJl8FV8ghg0pnx3b36dsmu+oJEpLgV/HYfG8NHBt4T0T6X9g1htSlfeUTtYYdsiFvZl7GOfisIBvFIFjX+Aktt51427MVJFjoVx0Av14M1yuUfkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743190993; c=relaxed/simple;
	bh=OLxAmO7yW2b8KKMedc+3ZdU1b31cGrrllojaBB9EdZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MmZzZTJYLZsOwsTyABbSwAFlyX//oaqZc5lpNIUhPuC53SNEBspVxlbSIl32W95MNWXtcfvfHVGnZyQzhqfk6E2kn4hA0m/3KJOeoG1QwLdOczbFoEy+nKTs47CxvQR9AL1ITWcwvTd/SYzik40BKBbrmuCjhtv8SUS044GdKlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=CjUcN1RR; arc=none smtp.client-ip=209.85.219.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="CjUcN1RR"
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-6eadfa03da9so3767076d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1743190990; x=1743795790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ODvPSfxlecP14OuA5OKuO2EdeJD2/HHQgbxBXvFdj/Q=;
        b=CjUcN1RRgmd+h+DNqzoT+AT4x2H0VyxybgSxUTZmtuIJt/T5OKfyfLb+EeTJEuL6ER
         K3UFIT5X582QF19jXN2+I5Eh7Jazrzpn6+Um0BCy+NEyQtvApDXsZ+Odawppg0Ds+tHe
         9rFDJvFsdp0hAoM8JQMkFIXopy54/05JIP1eSNh2vxZq0EsHo/wvVLWiyeVF5yRKL/ng
         SRIqaR9cFLQuV1MZKf77XrfO7gGEG6BZmJR1VWuvIBjce3E5OtW1zgdBVfEsdPDpnou5
         l0ngFK1b+2jrcJkKsIt/fMemEQccCIKGsMCQwraSEv5rRiv+OmqZ4ngcWhhC7eODDEtc
         8E4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743190990; x=1743795790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODvPSfxlecP14OuA5OKuO2EdeJD2/HHQgbxBXvFdj/Q=;
        b=smTMDnscbq5d7I62KuXpvvlT6wG8ECzykEVrltT6fAKgTgGPZiijeP7+LYseLRxpDb
         WAt5Pn21ht+9ZRnQQBaRe0AgAo6rNZDulEO0XTVkVgPQJ64xMiyuImMk+U53ldVIznwI
         tZQpiFWI8tiAiLVreJ70RvJ8YnnWe1ZFH3hYcFw/NSF7IffrcX+b36JNYWXqi/cYiYhi
         g9Bs/jDrGtJfcdk3YfA48CRxvbrjLJtqCYTS6WOV2Bb6AAjFsVjaJv4yyKJMrYGBsA5M
         1Tw/zoNB64Jc4l5g2fArzzVVCuIyU1wI5gBrVb7YlvlJBNwd/Nw0IlrcIJoR1kmbYyV7
         l7JA==
X-Forwarded-Encrypted: i=1; AJvYcCUCegDjgdbgPyoW0LerK102caQv4eZXGZ/Tv6xDuen3dzB3n9cCqgz5G72zm+KzNyemCypNygjqxs1oBqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAZ7mSiRh4vXFJohD/SfLvfpeqfXnMVV8qBPRPCBrenCgDHGFZ
	nvs9Jq+En6d2bs7Wvle4vQDzXu8Rap4zgAnSD/M/mL46qO9UJGGLYgb7QrHiMaur2q4mz4mqSVD
	X5p7nSBMTSsxmBlRzgi1hTDpgpp/BnAs7niLDtd1ATxRJzWxm
X-Gm-Gg: ASbGncu9tvrA7ZHBaTdXwFUOipvICRSpSYfyb9xlWrrC1Wu7KtwcBEzrAOMXN58odiS
	02dMFCIi/y3sfKV9V7DLOtnh8hPGT/fscvh3FVsUYVvsbYx6K/1if8lcgyHszutWRfyMTOl01ff
	uVSboY1zIehuyHN6xQnWTsnJSJxerwRn5A3v9AayGFPe4znmXpunJk6Gal1Tm0AiyVFaBpJ3bAP
	Xt7thoiLXsq8DcpmQsieqt0shsP6Dm3MP0zKQvL1Ey/VMWUTqFeLUsFV1EBRw03njvgILdUZJ/3
	zJZD99Jdk1N0/Y16VgQGsSnVglwTNHFZjQ==
X-Google-Smtp-Source: AGHT+IHE1BDqSoPFQBosK4FIZagJvkov+uoLlZNqBQtT2+qBsIa0Cb6b1jpVWKVmQ243c8hGamaf9x1PNGPX
X-Received: by 2002:ad4:5bae:0:b0:6e8:8f31:3120 with SMTP id 6a1803df08f44-6eed620e64dmr1735846d6.8.1743190990230;
        Fri, 28 Mar 2025 12:43:10 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-6eec97b6bddsm2788096d6.70.2025.03.28.12.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 12:43:10 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 2B899340325;
	Fri, 28 Mar 2025 13:43:09 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 1D2D2E40AF7; Fri, 28 Mar 2025 13:42:38 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 0/2] ublk: specify io_cmd_buf pointer type
Date: Fri, 28 Mar 2025 13:42:28 -0600
Message-ID: <20250328194230.2726862-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_cmd_buf points to an array of ublksrv_io_desc structs but its type is
char *. Indexing the array requires an explicit multiplication and cast.
The compiler also can't check the pointer types.

Change io_cmd_buf's type to struct ublksrv_io_desc * so it can be
indexed directly and the compiler can type-check the code.

Make the same change to the ublk selftests.

Caleb Sander Mateos (2):
  ublk: specify io_cmd_buf pointer type
  selftests: ublk: specify io_cmd_buf pointer type

 drivers/block/ublk_drv.c             | 8 ++++----
 tools/testing/selftests/ublk/kublk.c | 2 +-
 tools/testing/selftests/ublk/kublk.h | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.45.2

