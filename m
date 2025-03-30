Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C470B13A3ED
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743341333; cv=none; b=AB7p5sywz8rvcsy0mOxw7mdo8bm7xuBzMXsLa9kUVhBqjFNEPTzLvNkPw9GXvBVkMJ1Gr8DXai6kkXzb5lZ4lWq7z+QqB4ySMUdV0BoOfqZZBXbsHLFTC2k1nrE5PA0K6AGYd44vOZI5X1gyTXDVYM8BJNDcac7Vb4bhSFl5wso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743341333; c=relaxed/simple;
	bh=aA6huiGocNu7EQwpUsqFk3t3njZJowfv7VE74cnDdTA=;
	h=Content-Type:From:Mime-Version:Date:Message-Id:To; b=QvQiAObD4XFnjj4r8d2t3gSV7Q05QXL7PrOVnsHGgRmlQL9tUmoW6pUFd5TSjzc4DRW8pvWLYvYnCrsm7f1/cL2iv3GBUbi8FLTI2l5xXy4wN64Bu1crZv79QW3GCOfFD1fbJp+psyAATCTBl9LZuTGE2ddVC2QuKOnVtO53ShY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1mocDpM; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1mocDpM"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22423adf751so67525115ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 06:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743341330; x=1743946130; darn=vger.kernel.org;
        h=to:message-id:date:mime-version:from:content-transfer-encoding:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aA6huiGocNu7EQwpUsqFk3t3njZJowfv7VE74cnDdTA=;
        b=f1mocDpMiTVxdWoI2C/Sq+s23HQT2LoyfbaJhJ8vR2vy2WdDL2pjxM50MtBaS9kSdI
         NH3yfOGWhrJten60qcJjOXTnJtZV31SvxnTgazLSJbbkxce3V8E2EXBy/GwHwfxZY2Nz
         lI2p+gk0K6v91e8r9gh00Y2rQhY73hzAYACYlu9hPncXpBft7akjbuKqGirq6IjixRCy
         hl5edkGZQLUtq+nt2Q7XLUdrECxRszPjgjnIkIKfs2P36UouHXfnP8cw0//fZGwTOOXf
         OIUSxRYTtKwBsFFac6n/6XhmhIO4sfLefFp8JE6FA+bZMfQrNftO1MK62iEM/HejkLaa
         q/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743341330; x=1743946130;
        h=to:message-id:date:mime-version:from:content-transfer-encoding
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aA6huiGocNu7EQwpUsqFk3t3njZJowfv7VE74cnDdTA=;
        b=O0pD8h3stzfk4Eb4Z8tJCXKYssdh7miBguRqGNh2/8f5q2xXOdlS5J9xK9oOItGHf0
         T+MQq/acEdnpxqfm9hjv7TNNZ7sBuLRtRIT8FR2icoqTikXa6ZYXxhEmidrnuqkbVGdB
         3GQpNVkHhdoaYHOYGfz4XlEEnGt4NPkmdSXpuF0IZlnTvfHgFpwhxzvlNQubuQFb6UFn
         5dC7aZzlwebDlCNhyHzKObUkqNEuR0ZZ+jCF9GSIZ/RVySYYM2o89+Whn4e9PHyx/J7/
         5eu11lsyjRxGJq2747lFaKKeZd8QtKKwtKfdLHCMR1farFjtzVU3RzNr7FfK7Pb3FHOl
         4AoA==
X-Gm-Message-State: AOJu0YyWBMIWvT9e1RTe48+jBpngcDkKNkT2dR+3tzXuAizMF4/bnLXC
	ZAGG6JvPHn1ByD+Qbk+dzqxOMRMfIueihC2XpTnZ70rLi4IbzRCPdk/pQwHC
X-Gm-Gg: ASbGncurIJq0DytIS+S4VvqYmPnFhF3JcnFnF6jljLdB8Z/iiv2lpdeeZZkaruHY4G0
	VDRGaYnQ4zoXMxQYWWe62oNYxEVLTUnopOuuzpxSDhfLd9LbdId0Wsr18qWK4H/FXLwQ7a9BMGG
	thyHDXPniTR0DdiJvlT+4W1V+iI2NqOq0OV5D5pre8bVlgBywozmwZwpkXg/sjdGTC1CBAsmM9F
	kkc55GslpYBDyNmjinxRhagEX6/AFAu00JjEx7HkYwWd0duqWaCNF6Qmec+DDkzYlWTGpfX7zvo
	EtQz+1otRmsanWccbiml5t0dh6EkXsBGbuyUpxJNaWHmZ7AGETLT8z6Y58d1xsY2GQ==
X-Google-Smtp-Source: AGHT+IFq/5rPEMbZmhdsclJJy/gYCmwKPmattweiBYSbRs4HscdLbglMhDK7W8YgyVXTeKA0sb+04Q==
X-Received: by 2002:a17:903:94e:b0:224:1c41:a4c0 with SMTP id d9443c01a7336-2292f944b84mr90411195ad.9.1743341329984;
        Sun, 30 Mar 2025 06:28:49 -0700 (PDT)
Received: from smtpclient.apple ([116.122.244.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4efdsm7691444a91.34.2025.03.30.06.28.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 06:28:49 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: =?utf-8?B?7Jyk7JiB7J28?= <zeroone7568@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Sun, 30 Mar 2025 22:28:36 +0900
Message-Id: <CF02A0F3-256F-4E8F-95F6-B4D54A66810C@gmail.com>
To: linux-kernel@vger.kernel.org
X-Mailer: iPhone Mail (22D72)

subscribe linux-kernel
