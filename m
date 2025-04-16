Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D26D238C28
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801799; cv=none; b=n0gOwvNJMJ5AlPcWmzuPVF178UEX2XQrWEU/guuv1/u4FGAndsDB47Oc5RodYKdG48+s74o9Q1hD/j7Jh6tCH43lnP5/llTrTJybfNMIokuKfGQbrYaIHcpiqX9Nisr9IRJ9EIQzUsWvi/bw7aZltxBjwAyi4obGH6gQuosp77g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801799; c=relaxed/simple;
	bh=N300ZpabVRj6F4flL8Lfrs8xgF7O+jgFOpCvVDz4jH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cLsshM2vHzJysYudvvITHeO8K+RCcODE8caKXYBK+fSQbedmOa7ZWljNC0QizsYuvtcMBEmYrwoGSCPRwR0mP/NlZuN3vssUXeuIbKj/J1fmYK7jhH9uF79iRC++aVCRFuiD/3dMrFhPMP2ilx5rpZ7bJi9p3Usc+2lfG2dF8QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DuDwEREC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DuDwEREC"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39129fc51f8so5771349f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744801795; x=1745406595; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uUVn1E+5MASZtQAbRE/tz2lbT/kj3f2AwNu2uqycOxQ=;
        b=DuDwERECZX0nUED+9+NujIw+A2beToU3fyaa8eXcft6lO+jp+kPOgPq7F31HXa7l9a
         XPM93rbFlwG16nQAv/+ng4suDAKiSkD3/CfNow3+YYjUmY3JJVEN80pfjyk5lDCkBwkK
         G5Qu66G70QhKi4ttbcbHWFbyuYWtfHnezgWcSU5EjNpog0Y01QyLUhfkp3O8Ul8/m7PE
         FJy56mZiZIO8SQ7ZbRrfrV14fpvHVcqrGSm6bvdAJm0Iv04IXkQlaWAew0RhDd9cg+yU
         AaVx7M1b2IdhxLZBTfWYXtsOxB7PTy+uXaRxLqQqDZEL5cXj9e7t/mzNQmFVTskO5Z2V
         L2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744801795; x=1745406595;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uUVn1E+5MASZtQAbRE/tz2lbT/kj3f2AwNu2uqycOxQ=;
        b=DPCP9iR/kLk3549gvj3H3ssx+lFBpnqGPJqOqsxw3KNV86bg5DEzIhxP3Zz2GsV6VN
         O46rIBtHiFyARQwOSVnFsFYDkImfe2UjMbOsdYFNb3lCKJOilS3P+M4+7hkp7jVs9np9
         uREoI4zH6NsWSiEqKJOID5ndbY5pbu0KRa8VmXneXLcGpVmeM9F8gD02oKEGt8w8mUZc
         N3jdHKD7G3NFrBOgwU+SxAfrm36IEoMUctJSsWzfs6AXZi6YyQcvbwqeFxHsc+0Og/nt
         0kz/7Gq2LACT9svpYBled25T51roPG5NxKeEjAggnu1d0b+aaDcNUeG2GcprvKWB2yPh
         EvRA==
X-Forwarded-Encrypted: i=1; AJvYcCV6ScYdLU7F+BZNuOXmkBL5zeuhI5GVujFH6uPUhNTLcyV38VgbTlENS/kH7nRh3MK7PUokHlz7ZVTp6Y4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGWnaTxjovsZEPuaWCw1pCvvvEC1AuDK+DxWPKHzmQ0I9Y/kd8
	sSp8bpKi2MtZQ6qKRn5b4gnFtqEFTO9M6QYiGnskV7Xo3je/bD+tEfOBQahDEAU=
X-Gm-Gg: ASbGncudyjPzsWdlEcFoA6COVkILWw8JpvdvWqmiUqVZIAeQKA/tM/ESmch4Pf0bEor
	GHD005tz+v8T1WTkSLEGgtK7VpLw0tdpK2aCE1zdqtAMhYO+5VMH+NDpGC/QZoRiqg90iC6ieKk
	/mqkhpO1XQBE78Fegq+g70HgdBnYj3HDnpidcmdBAmXH9zDgyjrhbViBZk8W44+0kfu44YT288B
	G0OZGGZ1AxryHvFyyAXoO+EKjueAeecf5eB/LEcawI2zCt3CQuPybEvNPrgmy7ILPtoUNR5v58S
	2e+QiiaBcoD1JkLHD/d5NsK7VH4gnIMKqA6qPKuDLuYKKg==
X-Google-Smtp-Source: AGHT+IGnbNlOdz2yVZBXGlqvERaHySPWwtoWVnzqqpbftBIEbIEdovohdZb+YF7/4pgI9k2rY2uGfA==
X-Received: by 2002:a05:6000:248a:b0:391:2bcc:11f2 with SMTP id ffacd0b85a97d-39ee5b10fb5mr1551778f8f.1.1744801794634;
        Wed, 16 Apr 2025 04:09:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eaf445742sm17013298f8f.95.2025.04.16.04.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 04:09:54 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:09:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Howells <dhowells@redhat.com>
Cc: Marc Dionne <marc.dionne@auristor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, linux-afs@lists.infradead.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] rxrpc: rxgk: Set error code in
 rxgk_yfs_decode_ticket()
Message-ID: <Z_-P_1iLDWksH1ik@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Propagate the error code if key_alloc() fails.  Don't return
success.

Fixes: 9d1d2b59341f ("rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
It's not totally clear if these patch prefixes are real things or just
a cat walking across the keyboard.  "rxrxpc: gk: yfs-rxgk"  Really?
We expect people to believe these are real?
---
 net/rxrpc/rxgk_app.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/rxrpc/rxgk_app.c b/net/rxrpc/rxgk_app.c
index 6206a84395b8..b94b77a1c317 100644
--- a/net/rxrpc/rxgk_app.c
+++ b/net/rxrpc/rxgk_app.c
@@ -141,6 +141,7 @@ int rxgk_yfs_decode_ticket(struct rxrpc_connection *conn, struct sk_buff *skb,
 			KEY_ALLOC_NOT_IN_QUOTA, NULL);
 	if (IS_ERR(key)) {
 		_leave(" = -ENOMEM [alloc %ld]", PTR_ERR(key));
+		ret = PTR_ERR(key);
 		goto error;
 	}
 
-- 
2.47.2

