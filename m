Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75A5E55B
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747409149; cv=none; b=MoIh2ZNyZGG6j+nak9aEV06AiKjUnImdvWLR/TD4JlnbfuZBJc1jVTnCLdR61snpm7cuSyKnOmU3wuLES3gXQxX7m2r/0PiDNRMQsbOYKAaraaCL24zp0dXIZWLSnbofTNRxq1AWVejPct4LnKRpDSIamENHy4uuftZ1Orr/qec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747409149; c=relaxed/simple;
	bh=T4BIEAhDTqZRM5mH//Q104xKr6Ry1/Eg1Nn09EvX+g0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QbXXrLhIsc9Ur+N+5ySjj+aK4LnPZZrzabiMKQ4HYa/AAEdcyBFv1oHHLMitWy+3XShtqk83iJvhRN/oJvU0itPFd12Cpsha7Ug3JjMa+c4J0TK+WfwNGTG+0WmyCJPeFSzXGCgxNP4xhsdLzHfqqKIOfHVqLtXgKlLfCQL5bus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVRX/Cgm; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVRX/Cgm"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso369802166b.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747409146; x=1748013946; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l5LnrWpUjzC81baVRdodmHMAvpPilsMBmZXNYI9sj7k=;
        b=TVRX/Cgmc+yYsfcqdJEohwJrVuyzLpUUBYHuTIDmvMrV2phfGJQyh4AjslzaEomtge
         5HkIV77SfxUOpr+Gi5JwprZ1RkmowCoTb4LVVpO++nJtpoh0qU9rSkwQdm4oH3QlUNC6
         sUa7wKJmO9fPd4jFc6jQdwx4RlJzRZUbOCIhVta8eYzPxjA1ZeqSB7uMu0uHvQgRu6TG
         dEPHFHM5Do45SbmCFGCvqB8oExrjaDGoOkqIuqRaVHhHdnfgLnKgv+sfcFmLsrLGrPaN
         hoShbyUvNIWdJ/SU6gUEJ5Fb5eOB7UUXvtuLBxP+xyzkTn5rjmiUccDm3dTNQ1ezOaDO
         cVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747409146; x=1748013946;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l5LnrWpUjzC81baVRdodmHMAvpPilsMBmZXNYI9sj7k=;
        b=dWzgLuoRP98SQAhMcU8skV5DDEnBRlHkfI8rEpTQwp0ayWooRUaGz+R5DzR09JvMjX
         +xPTkmS1nELpq9R9qqsqMIRMT1A1ma2bCJu+l4mpn4UW231IJPstGQswoP9KoeFr8Tyj
         +vaj7BYaNwCAMs4/kI0m9z31m0OsukmkBueSyWSpbxhTJhIn4EgdDUbmv1XVnHLQ+t4Q
         DsGLrXgNK2quYMNnbu81Dw9ksBv2AJlrs6FUCykdSVPiQSL9CachUqzsFVbRyMt+8Orf
         bdMqkbEq0krMZjBBvSzy0sMwiCyjYLgogRYND1+XfQ1poz9l8uC4Wn8dJQRPh6HwdZ2Z
         uTPA==
X-Forwarded-Encrypted: i=1; AJvYcCUBxYL5wg7Ssdf4OwTiHZuH15NAdQ5xA8ctIGF9BzV4cHFNKhNCnhfpypd6ssuhuxXk4z5Y56O13P1bcpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqSFZgsRzhRtsGaBeod6xHyohtZboyFjSV4EcwVOAZm8rGU6KQ
	W1vaiO5lZKNHMDTm0c9UT3s+LojLPTGJEZVRhOWCw9XayzfSyY+n1WAO27Fw4VU+
X-Gm-Gg: ASbGnctJapcnwpEh0B2ZbEWsr1BhVXoTxlqtOyG8jaF9hv1NlRUZ9X3k5cQ13ISIKK9
	vHf4sHVN/VVyiyZ6pd5koV6JfUh582M5eUHknY8VRgnkB0830M2fxFZnKF1ABXd5EbqkHYRyj9Y
	lKv3nAWlsIZTeRnjggAoT8QjOYoEvwOSJPxnfIhKkkMZopDEK4871wJ9NZVEuSdm8R84uLaqGBy
	mVarkIk8fdaOhQggUrSXwRDzm8h26gnIsh9zbgyY3Vmg7uiSNYpoCGbhVoTcA9KOOM3fZ4dbXXl
	FpFfy7Wz0Vg/7bdwuwUK1/gnK+AAtEZBLXUt3UKJDh7AFSdSCIznbIbem4DjROgJBiRHOUhx8yw
	pbGdrXM44LtTNz9UmJ9SqdcfP7lbu2Zj0aCC/
X-Google-Smtp-Source: AGHT+IGCd4kvqEQL28zuvNOdejv/esSCapeHgE1kimyPHzr1Kjusxal7Vrwxo7ZEzhkXe4YSHMvxTw==
X-Received: by 2002:a17:906:f5a4:b0:ad2:450b:f8da with SMTP id a640c23a62f3a-ad52d4ca492mr373367866b.19.1747409145958;
        Fri, 16 May 2025 08:25:45 -0700 (PDT)
Received: from andreas-VirtualBox (089144209151.atnat0018.highway.a1.net. [89.144.209.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b096sm173795066b.33.2025.05.16.08.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 08:25:45 -0700 (PDT)
Date: Fri, 16 May 2025 17:25:44 +0200
From: Andreas Kleinbichler <andi.kleinbichler@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gpib: switch to kmalloc(sizeof(*status))
Message-ID: <aCdY-OgvoTUjcIeF@andreas-VirtualBox>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix checkpatch warning:

Prefer kmalloc(sizeof(*status)...) over
kmalloc(sizeof(struct gpib_status_byte)...)

Signed-off-by: Andreas Kleinbichler <andi.kleinbichler@gmail.com>
---
 drivers/staging/gpib/common/gpib_os.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index d87025aadccc..0678829ad14f 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -198,7 +198,7 @@ int push_status_byte(struct gpib_board *board, struct gpib_status_queue *device,
 			return retval;
 	}
 
-	status = kmalloc(sizeof(struct gpib_status_byte), GFP_KERNEL);
+	status = kmalloc(sizeof(*status), GFP_KERNEL);
 	if (!status)
 		return -ENOMEM;
 
-- 
2.43.0

