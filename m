Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CB8221F0F
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748463758; cv=none; b=GGZU+FOEoTCeTpMrxWeVqWa2D8PwGmqzUuVVQ2KmBNscTciDuKG5MAOeCAZNn/5tR69M2HjwDADxb1PHKOdS5ts02NhQJYjqprWIlJb7hzcNhiORC2Qo/7pB6EX1pJAJQq5jLsj5ae8iIeWN+BkN5O2KJ0u/D+U0OBd9nkUEK7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748463758; c=relaxed/simple;
	bh=KkXe+Lm+rabuheSlfIsCTUsWtN9PJTjQap3jOjZ/bdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdx9JKjmzDmtAW2rYEGCCUprwlTCc7udu3OK6beePY3KbZHm5USIkTV3rjhgCPQUK84JAJzA+9bz3hiHqaDJoUCcXXrlOoSbBs+LoWBsthgpxFEG+45WLxh2H7hwjDy56QASU3plVoh5Q5Lpdnev6lkTBDqjtTPV4j87IEm8Efk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HdJaikkz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HdJaikkz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442f5b3c710so2394715e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748463755; x=1749068555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c5CwG2DjF5EIaVt29I4TTm2tkN33VTDrEArKVdA+dcE=;
        b=HdJaikkzyDyByHHxF984kKe8M1erWDtSOsa/LtecJyQQUaQAnv1g6LaCwpsb74+jgE
         zk/WatajVgy2WdXOhC2pduB3CBsh/YfwRxS4J6ZHVF/Adi/3POxRMTxQONTVTSEn2Lls
         Anulpt215clW+kWL9F0E08CRi1ooDYi62T2o5ZfXEjlOz4a/FqVECpHbU04um+YhIThy
         DuPkXnmNTLRRBaoK00Bjj+nkvV9bOuXfzHjvuop3JZceX9WZsvGaFEGojUVrK7Ov6A2t
         y67j0slDEDx0AXmjN4t0HwQhWd5t2Csw18JKiEETuf8bTn1TZyKDzYKlt+HTGycDLmMN
         ZB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748463755; x=1749068555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5CwG2DjF5EIaVt29I4TTm2tkN33VTDrEArKVdA+dcE=;
        b=OaocQ2ryMkzeUEL2je0OjJnjx4Is7IvKgyJzHAcxmE89J3OKIi8yYix+cVMnCR3/vs
         drtyXLUmNVk6zzdDmUTGUCtP9O+cY4JLjLTrRog/WPGcF7PN9vKsJQdSVnJFLLd1gXX2
         Jwx8JrsoK+8HuPmFI+wCcUP+I/tiB38lkHhBSVglXqPoC2NOySL8EpNzIIUi3BIM7NOG
         KwsYovSQgWL+1/EQFRrzD4XY5IvWVgmKbRQmHp/dAqGJ10zIAib9L6QtHAMxs4ojhWu/
         jtugkDrY2lHPWeHdjiie6wHA3sc46KMIoyGscJdJ4zi8ZzBzmlGlELJ7KNYiZlNQrPyk
         FQ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmQe2vFQPGjypZfLQBAa2ba7MEPWiY110km7N1VTho3cHGx+vOQyESXzKomnclCZz8TrByCmM5NLXqGdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ0xVK0XUxrMsl+VK0GiP39RLQy1gUfAcVtdAnPaU0Mfc1YmTx
	bdmrzp1AB+4+v2okz4g07/PNtkJV0C+rN5eYjVors26fEoK7hIVkp2S/vnWxOVt0+T0=
X-Gm-Gg: ASbGncutIFhJ8GM2mYF1hB+bsm1w5/Hc0dvrK0jmeHLRxx2Jan9hL1Lodtkg2AYpY+o
	9YKNc0X/pqwi6QegJUiwJH+UU0nCtcwVrr1rAyoIw71O9HcLXGCobxWvDKclBxIn3U20T7OAG44
	kUC8ZmUxTnQ9yoSWGthzDS/3l/kDINUwDqkPyqoa1pZ4qR4l91BkyDVfoHAnQD8ftm7+RZa/G9F
	P6QrnArU4PfpMf/L2FPfJWhKng9obnhLZFhMF887vNnwdY2rocYeomuM45HdA63axAkLjwBs8sY
	+UOICrTYPaVBcR0jStsr0jvwpJGk8+kMzyHD9R4awot5GR31Jcptpul4ieMs+POZTg==
X-Google-Smtp-Source: AGHT+IHpyf0K/RJnIz9oYa7SCeInqhGIp/UYOUV+jDz2DXQY6iQAbI9UyULPYQBzAB+01wRfsWA8zg==
X-Received: by 2002:a05:600c:4e0a:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-44c91dd158bmr173850615e9.17.1748463755420;
        Wed, 28 May 2025 13:22:35 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450cfc03c93sm1116955e9.15.2025.05.28.13.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:22:34 -0700 (PDT)
Date: Wed, 28 May 2025 23:22:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kees Cook <kees@kernel.org>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Erick Archer <erick.archer@outlook.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] Input: ims-pcu - Check record size in
 ims_pcu_flash_firmware()
Message-ID: <131fd1ae92c828ee9f4fa2de03d8c210ae1f3524.1748463049.git.dan.carpenter@linaro.org>
References: <cover.1748463049.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748463049.git.dan.carpenter@linaro.org>

The "len" variable comes from the firmware and we generally do
trust firmware, but it's always better to double check.  If the "len"
is too large it could result in memory corruption when we do
"memcpy(fragment->data, rec->data, len);"

Fixes: 628329d52474 ("Input: add IMS Passenger Control Unit driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Kees, this is a __counted_by() thing.  Would the checkers catch this?
We know the maximum valid length for "fragment" is and so it's maybe
possible to know that "fragment->len = len;" is too long?

 drivers/input/misc/ims-pcu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index d9ee14b1f451..4581f1c53644 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -844,6 +844,12 @@ static int ims_pcu_flash_firmware(struct ims_pcu *pcu,
 		addr = be32_to_cpu(rec->addr) / 2;
 		len = be16_to_cpu(rec->len);
 
+		if (len > sizeof(pcu->cmd_buf) - 1 - sizeof(*fragment)) {
+			dev_err(pcu->dev,
+				"Invalid record length in firmware: %d\n", len);
+			return -EINVAL;
+		}
+
 		fragment = (void *)&pcu->cmd_buf[1];
 		put_unaligned_le32(addr, &fragment->addr);
 		fragment->len = len;
-- 
2.47.2

