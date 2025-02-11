Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB7D24FC16
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739298369; cv=none; b=LmIN1vFWbwMpkEWU8pet5/o6pG6wuBzjdAf6vHCJCPEudR4MR0TAtbCllOdaGF9vBOqtkhkzHh5ynJTN1QiGdAnQqLb3Ki0PG5NUWfHEVOAEMIS8URES+Nzvb2oanFS13vJigeS4er0fF4XpOWkZH9cuD+kxF5jBQl4k4Bu9ga4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739298369; c=relaxed/simple;
	bh=elkhOqhLP5D1kUfFgIKYEIuUu3bYbpwt1x5C43X1MUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hz2Z2AazZuoNIhnTIBu8D2vtqApS+LGrVDaOi6dKlx2ZnMM/rZ1RgIe63FgXjBzRS1fF8Hpa3e8kvkbESvkPBWbsjaijVQC5C9okw4q0BH9jM4PhXHOG1xNOXDlA5VHHk2RLgUQ/ZgkBbMaK0pfcAaWjoX1LiAWMRxt9D5sSRnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=q+ID/jn3; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="q+ID/jn3"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739298365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=idU4M1eBTyORkzLLKsL5gMIZbBkj9wGw9TueyObtiRQ=;
	b=q+ID/jn3SpGNrR3SUWLvrQ/iBKesO0BAR+scpPxJHyo9U/bLZNkvoR2wiqgrU+mdMJ59Na
	ZUmbuwm6PpcvJpQiobs9PpT+ICpa/ekPnGCRK4cZR1ZTM/cAWkGJtZM5/XDrY+xTv7067X
	p394CHAcjdF+ANORjQqm2ezYVyDNpDFeWjcdAB222DbzxUURiXEfNTN1R0wKqkK6Thitz0
	eAlSRpJgJFmlXOFLhIq1rdOE/ePv0ASsLZQJ0cQ/JkqXWXoB4BlH3HmbLgFYNw/BXiD9g1
	MIFYBBCpKuXtXfOxGpSpuEIocoAUvjIpgFZWaGHuaWleU7pCkeinxcGtGmmNxA==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Date: Tue, 11 Feb 2025 13:25:58 -0500
Subject: [PATCH 2/3] apple-nvme: Release power domains when probe fails
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-nvme-fixes-v1-2-6958b3aa49fe@rosenzweig.io>
References: <20250211-nvme-fixes-v1-0-6958b3aa49fe@rosenzweig.io>
In-Reply-To: <20250211-nvme-fixes-v1-0-6958b3aa49fe@rosenzweig.io>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Developer-Signature: v=1; a=openpgp-sha256; l=854; i=alyssa@rosenzweig.io;
 h=from:subject:message-id; bh=8vBQ/v44cM9RurlOEJqS9G0+SOpYh3VTVvP62muKOs8=;
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnq5Y3JoRTpZggfiWVdYcP0iyVHDJ//MLZ5GLPN
 83hIsPuBMeJAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ6uWNwAKCRD+/lBaCvVY
 DUD4D/0Sx7sJnd8ickbkui6NuiZpuL2EOI7nalgwVj2PqptKMNPmymjt6QlI0ip1HudADNTfCHW
 dIyn21enlKeH2lViS94Gb+1EjYNnPGJp96OUvz7ub2LIeNG/SMwfbTSd9Gt1hBXI4CvRk36xk3g
 FQemoR5vedw+A4sgDRv1Q5j0x397vsGBcHvJcU/jRD6In3AUXAP7buEaUFYQ9ZB69JILR2oUk1/
 rc7vMmQLascmkAXlMR7OhCGbpLpR2o3F9FnUf6H6nJ7oi8QaGWe1o8LEd3m4qP5yEoOGzGEq4oK
 W6b02fzoeE793G73RvH07TZJpAzMxYCJO923p1hD3RSjmsdTmyjtubBKi5eYWPZRGezx+tm7nhm
 0ULV7N7OZPrk20ZkiFktC8QPl5Lwz/Jwm0qoYSW7XY9OXiWkprnvcinsP122X9KTXmsEaqOpoG2
 vxYCzsr5FK08P97nSpdRIX0vvPTSCrETIOmV7YH6VyCp/5atF80JB2ioeRLDOHLrJyJRqc0RkFi
 1J5237GfZdT1fZgLx5dQi+eha80Tqw9lm5P9ctCyfLA8ERvz/Yhh2Qct6wc2rqrTl5pIKt0oo/E
 Z68lO22qqvvp94ftRBHIIcbMMVj03htBaRcJnRFMYeAGlX3/Z9pmWQM5EYRG2H2BvP04jy1afFa
 sMW2SrdBa7ltplA==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT

From: Hector Martin <marcan@marcan.st>

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
 drivers/nvme/host/apple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index 5e1c01a67ee81a36faa3da2f86a3a24fefcdfd6f..a060f69558e76970bfba046cca5127243e8a51b7 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -1528,6 +1528,7 @@ static struct apple_nvme *apple_nvme_alloc(struct platform_device *pdev)
 
 	return anv;
 put_dev:
+	apple_nvme_detach_genpd(anv);
 	put_device(anv->dev);
 	return ERR_PTR(ret);
 }
@@ -1561,6 +1562,7 @@ static int apple_nvme_probe(struct platform_device *pdev)
 	nvme_uninit_ctrl(&anv->ctrl);
 out_put_ctrl:
 	nvme_put_ctrl(&anv->ctrl);
+	apple_nvme_detach_genpd(anv);
 	return ret;
 }
 

-- 
2.48.1

