Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108F3238D57
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940718; cv=none; b=cbVMyIlPQIxDb5AK2ftNYFJHG+kjFXCHKaPbRc8Omc2c9dfuB05V2BT96fJYwq2nJVOUai5x+VquqKFvxf3EweiZJPbbi8wim8zRCt+4TutZ3QKTpNNoeEbuIcQiqwDBJSJ2+pELV05CA8NPYwRflJoXNbGxxQrzJtzwnhe02Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940718; c=relaxed/simple;
	bh=JM75lUan+PgZjJreOeRDnaaV1XjVImBU+5Ipcn4UJkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OFZVMnWQ/gZJb+zdN8crzqHCkQjhRLsCChlTW5jKq2ikgICpljqJltzn0dfqe1jnOBZxX6vD5GFk1vm5WnJT96ppNeNvUebHP5hpwuboqJtBOtp+iulahXYI9ejGrrIEud/Hqn1KkoX5uamekozu8eCX5IvZIS3Ss20SVpIQtmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jr+5KiKe; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jr+5KiKe"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21f54143aeaso1708315ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 07:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738940716; x=1739545516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rZqqE3JGOQwe0uxvTrE9UiOzWIpwjT46qv4gIG869E=;
        b=jr+5KiKewh5iliCaGeBHgiNFncY3uXgoW6ZOfJeZ3X6nJIhbWgTyPySCMYFw9c86Vw
         BuFALpYqg675mYQkXlbtC7Z5Ftmj7/a9KWQ4W9HHxBzA3Hyo+vcE/+y85uxZMnsyhTT2
         +mA3kNT3c8F5GNt5Jc/4gTH4kIr46cNpE7dKTxxSOeP71x+zXA4E4GA+bE9ResooOiv1
         XlQeav5tpeiXldlvISFcapbhdp62s75XDc4zEeKjx9HzLSS9vzrVF6yBJFy0fX0XrsZ3
         2xGNmP69dd+Ri/7QUtND05chR1ayh1xWhiUqfqfo3a+JEFqGkfK4CDm9YAY5TbMQpKQP
         q+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940716; x=1739545516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rZqqE3JGOQwe0uxvTrE9UiOzWIpwjT46qv4gIG869E=;
        b=YiUgBIr4YPdM6sekP7DOdAlkgh3IGOmZrcvVBD8+N8eJ04/s7cQyWusdlXv20GN252
         h15kjn4IwR7nm3DYaXE38btCJEFpexCPmEm8qZz8ZvrP5Ag1yB81B2jSj/YyKOVN+cuT
         a5ij63MULhs+9TpCc0IRmrRFlpJfepzBBhMGhyaqO2yFuTJnRfJYrwDcrnn7k48qgoaG
         IV3pseYfRNL8VvC4TL/lRimfyNXkcPP1SNBgNHKKES+sAueDQSPzc6W1Ylr2mJlwSrdd
         La1082SPXGuUk557o/vrclBF0uwpahfXl3u7KbPtIqMSvs0A4F88VpdV2mttz4PQ9nW+
         AG/g==
X-Forwarded-Encrypted: i=1; AJvYcCXUc06LT64P7bLpM2HTh+gnbHOzk4FbOZxgGm+a3MSGW1D/Vl/8vHVsOAM/ZP3sVmdcL0dnXAIZw1MEjjs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkzURQMBpyX9gyRvxEOu3f6V50EJBlyC2r2jG1SQITSMasd4/H
	Jk8VPq2CclKnaP2IrjLvAKmkgW7z43SUzOfIFL4VmgqAluRAxagb
X-Gm-Gg: ASbGnctAqgM4J3E14THOpFLNPG+Fo8G1x1U41qRyisSMrZzlYiT6XIelAlS709t3Uji
	L7a27/mwOVZ1otvtLY4nyB205QprTJbil+4++Wx/zioxU7uKZNMMFn6/iSZdY6N77wE0poAq2Cn
	KgK/747epXqGlkeJ8UMlJN3t7wUMUKrJy1cD3vxCEo7ZItA9VJpY8Qor828COyBLERFlXRUtDcw
	rOlnWf/8AC+l8oCCqwJN1+nha0MxTXnsqvFOFgtofYcaBLoQT23HoI4DghmC+KIdERDc4bGJQPY
	XZSQwh9sWFNKne5Hed78brjRCvdk
X-Google-Smtp-Source: AGHT+IGAOd3eG64EQ/+fz78StGhKZCLqlyg80K+huyKXP022AXPhWTWGkNChoIscgZ2sJe4N/sY6CA==
X-Received: by 2002:a17:903:32c7:b0:215:b75f:a1d8 with SMTP id d9443c01a7336-21f4e1b1236mr20050945ad.2.1738940716290;
        Fri, 07 Feb 2025 07:05:16 -0800 (PST)
Received: from localhost.localdomain ([2802:8012:30:9200:a83e:911f:eb3e:1cb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b143sm31855815ad.54.2025.02.07.07.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:05:15 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ajithpv.linux@gmail.com,
	roheetchavan@gmail.com,
	niharchaithanya@gmail.com,
	eleanor15x@gmail.com,
	everestkc@everestkc.com.np,
	kees@ijzerbout.nl,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 1/5] staging: gpib: cb7210: remove unused variable
Date: Fri,  7 Feb 2025 12:04:05 -0300
Message-ID: <20250207150427.153982-3-gascoar@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207150427.153982-1-gascoar@gmail.com>
References: <20250207150427.153982-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unused variable 'nec_priv' in function 'cb7210_line_status'.

This change removes the following warning found compiling with W=1:

warning: variable ‘nec_priv’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/gpib/cb7210/cb7210.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 381c508f62eb..5c2b2c382df3 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -383,10 +383,8 @@ static int cb7210_line_status(const gpib_board_t *board)
 	int status = ValidALL;
 	int bsr_bits;
 	struct cb7210_priv *cb_priv;
-	struct nec7210_priv *nec_priv;
 
 	cb_priv = board->private_data;
-	nec_priv = &cb_priv->nec7210_priv;
 
 	bsr_bits = cb7210_paged_read_byte(cb_priv, BUS_STATUS, BUS_STATUS_PAGE);
 
-- 
2.47.2

