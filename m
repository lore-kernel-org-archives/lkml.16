Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EFB26A0E0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396558; cv=none; b=tkrmUD8h7rndN1RQUlLL4VrVFGaenNqC8L6qc6hJbttVVsVKShdgt3bYAskaj/MT9vXLZGkeiDFWQcKnLWgGMm6OSsg/DkKBAZKK5gq8aS2GURgBStrq3Y0pMlDWYFppmJmIgdM9/IrGimeHaeZgnlDM+BTL2LwICFTp3SnCKKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396558; c=relaxed/simple;
	bh=rYe7xCZFXZi2rJ9KLdTiTXrF4ctqCKSc48aSu6KmDK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E2DuDnH/4XIA8R2tDYio8qG7C+Gtzkl/NkbdfhFBzsI3swMqLlNm9rnNJKmMxkyxl2h/cf7n3BYPvj7ZZNB1mtI+7mf0sar+030qhRfRz1jL8NLe06CwKTxsLA8rYA8dIu/t2aDv8QXr1mh+nspnV2CQvalRP/swLZH4uTpG6lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CNB8slTR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CNB8slTR"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso28724985e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745396554; x=1746001354; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OzrQBA4CpzckjRHBNUti5Dlgso51XuHDeOZmJZ7DHrE=;
        b=CNB8slTRiEStK8/1lkXd+jPpxmUz0vKCoGCOxLAkF5uRYRFk2PE7b2It/yEkf2egUq
         97OldNOjGFfhm5RCwrVs7//IwGnQxvpMOgbetvPPyMt35OhEvY8v9GjpwDRQaDgjxtnl
         cvw63ecRK4+BZ2guAuz/vuygGDbhwssyhG1Wm5sxX7Y8btxIJOjnaabl0uyUabV+sfut
         8Ue05qCSNovuXQ8dFn54auKwrIfEHCWUhtBdK1QeFYOyn5FC2kbwKb0fpW5dmofPbifE
         cbxx1u3NRWYtEm9340RyEH7UmgFnOJdJuEmNytpPgIODSsoM+/JBVBBKWQ+Q8KFyE5Mc
         aE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396554; x=1746001354;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OzrQBA4CpzckjRHBNUti5Dlgso51XuHDeOZmJZ7DHrE=;
        b=h4LM2dvoXnGHDq7snbGoFXGDoIWh1LLKWlj0nlufoQdsxuNMyfWqbPlYLioEEFJOXf
         BYUIej9m+0QiiGp82LNi8LK88ynVaoT91JsNFYSWcG+nFdRHbyusvYEBK4Va6ZLdKJ9A
         tQPqMyXeRiCe7T5C+a16gllirdE6TqJCKbzk3Bo37cqBDLLnWnU3BQ/p00wbzIxk9oeI
         iwANVWPy9ChKiuFvOUdg0ZA0+SJk76ZJ8A2XvWh+899tHc5uvOH9FlTtbnOdFmrWrUk1
         qBqHLklazEHPfFRjy8gMy176cID1kuvoi14t5enzml0arr0x4DVKcf766s24X8XzIUi+
         5ArQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS/NF3PAhEmNLB0lWxc/jnLSOO55W9QcJ1q0qKhZ2nIrQwQx2IUuFBnvMQlXBy06j7lUEpusDcbgG6iiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YylriPU/7OkaX6drmN/Jyns66v7aRR2t281VuwWsYBgZFKNZkxc
	kIwQ7/KedWT31g8Wo+L6hZ7zOSapJnkmqXC0UtieyaPXicYQa61LrZecBZ9bKAj97i/SZuIgrQX
	b
X-Gm-Gg: ASbGncu3KBqv2QgfFB+qLBFScJm/UVvmnfVi/HcrK1F0aDQ4Sf1+rynhPMkcn1yf/Cx
	+ODADYfkX5o0eg5To+wRaLJyiN3iKy2Hont7SDD74tBxkuCwX+dHHnw/dwyb2JvukdkQN3VZQVe
	gxn+gakszk4uCLcm6P5DXcfA5T1kb88ECCllSHc4XemchB7C1fd3pwhCpaFaSviVr89+WUXSDOO
	fb802FOPDmS95lLEjk7Vsiv9fBroBgtRvgNPo8nBuHBcYPrE7dUgPjHHACo3CcXX4TeQF9n8fZl
	hx1enACIQ3vImDNG+dRFsQcQrpaSqybSdwHUdP5nrnJnpsCYcIf/Col7
X-Google-Smtp-Source: AGHT+IE65/jSNAWn1NN058whXaIq0omJUvUad7kdZ7VsTeU37e9qUVTYQjbwSJReUDlCUTQKveVgjA==
X-Received: by 2002:a05:600c:1911:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-4406aa8b882mr174359035e9.0.1745396553802;
        Wed, 23 Apr 2025 01:22:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092d1709esm17040125e9.7.2025.04.23.01.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:22:33 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:22:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] misc: ti_fpc202: Fix off by one in probe()
Message-ID: <aAijRtGLzKLdwP0-@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "port_id" is used as an array index into the struct fpc202_priv
priv->addr_caches[] array in fpc202_write_dev_addr().  It's a 2 by 2
array so if "port_id" is FPC202_NUM_PORTS (2) then it's one element
out of bounds.  Change the > to >= to fix this bug.

Fixes: 1e5c9b1efa1c ("misc: add FPC202 dual port controller driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/misc/ti_fpc202.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/ti_fpc202.c b/drivers/misc/ti_fpc202.c
index b9c9ee4bfc4e..4e1871870769 100644
--- a/drivers/misc/ti_fpc202.c
+++ b/drivers/misc/ti_fpc202.c
@@ -370,7 +370,7 @@ static int fpc202_probe(struct i2c_client *client)
 			goto unregister_chans;
 		}
 
-		if (port_id > FPC202_NUM_PORTS) {
+		if (port_id >= FPC202_NUM_PORTS) {
 			dev_err(dev, "port ID %d is out of range!\n", port_id);
 			ret = -EINVAL;
 			goto unregister_chans;
-- 
2.47.2

