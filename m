Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337B943169
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 10:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744541320; cv=none; b=Stg8cUPmUB+NFKV74mLf7vLw0v2zeYHU6K9SSnbO8A82bQN9ZO1AEHjEm2huVCC+YlazslFEWWKHO1+4xVdF+bvT8aaeMvHT1M/hyAekU3UozFw3wnKyrJbyljo4ihdGVLe2hxWcfguwhkrIunKA9mXhuivaHHsIaH1cs81rnOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744541320; c=relaxed/simple;
	bh=deBGa0qoF0WFAurDiFif1tPvsN/SR4Oznl05+d20GTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OQaHQ9G1N88o6XD2IAi32yLcOLlrJjRtymQcCuUhLG4V7bfy4wRMIeJyF4f1vN2IRRkj9m8GIdGFNRCiTgOKzG3a85OShdELT5Qm9jV6Mi2IBxE0eARZfs/xezaVXX9/1Yli0r108sbeU+v9utEDLfAeCN/uVtNQcZinwxuTYIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pteAQmfs; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pteAQmfs"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744541316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FwPalQ+WPPJJofPUk8b+xFc99j4ifYRnW/QMrgi5bv8=;
	b=pteAQmfsLDQQGmwcB45zrDjGtykwo7sY/P5MUQzur/kdtjZkCJTNS0J8EFQKbTA8WpX91N
	bBbOrD/WIg8crniMxIIwGSqez6sIqvAqUUzgVi4AIeD0+s9dDo1M/P0MfRSfPx4Sg97Av/
	HMwPjPsm+iChEVHo4DjLiv1gh/YKpT4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: Reformat code in gb_operation_sync_timeout()
Date: Sun, 13 Apr 2025 12:48:03 +0200
Message-ID: <20250413104802.49360-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove any unnecessary curly braces and combine 'else' and 'if' to an
'else if' to improve the code's readability and reduce indentation.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/greybus/operation.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 8459e9bc0749..ba26504ccac3 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -1157,16 +1157,12 @@ int gb_operation_sync_timeout(struct gb_connection *connection, int type,
 		memcpy(operation->request->payload, request, request_size);
 
 	ret = gb_operation_request_send_sync_timeout(operation, timeout);
-	if (ret) {
+	if (ret)
 		dev_err(&connection->hd->dev,
 			"%s: synchronous operation id 0x%04x of type 0x%02x failed: %d\n",
 			connection->name, operation->id, type, ret);
-	} else {
-		if (response_size) {
-			memcpy(response, operation->response->payload,
-			       response_size);
-		}
-	}
+	else if (response_size)
+		memcpy(response, operation->response->payload, response_size);
 
 	gb_operation_put(operation);
 
-- 
2.49.0

