Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EED255E4A
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739214686; cv=none; b=o8DPK+keVbfnutv4oC03xAcrQ0S2hsJKnMWY6eHnH0VZZA5WtirX40iQFt15bjVS/HWr6f3gg8B+fWifVUHhDDBYhYUoA6hSPi1DT4V6I+HE5udCwn1XjGKcG+CT2fL2NyZ27gAei1TaZFg9itjmllh8gast7ZQKQmLVzJtdRjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739214686; c=relaxed/simple;
	bh=FuRalVomnUo4fAYGb7ePQCR9+STX3xDmBsVlwWk2WsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+zdrJe+TVbv8MT5oCPEzP1YbN8ONceQmyrs6wC9gCpvQvyVUpOWr/9ZfZO4+iPAoZj+TjrF8tC28mGRRoXjceIpZyU0WBRVRY1Z9NwS8jNX8bXFb9uweV6D2joeefMElXWHEW7SWtIfuqI2NxyDONG/sL7UAlfv5tsYhBnhzEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=O55MLCSf; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="O55MLCSf"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab7c501bbecso204952066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1739214682; x=1739819482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRdLgzD1wD3MEmKM8GjV3bFdVy6SihSEQKzMmUmzv9E=;
        b=O55MLCSfHMX/xT/5jbCTnxIqoXXpbB0uejuD+9BX5SJG8UtOVBAoQmaCP4WffhPzOz
         zKkH+dpXq0RZ20VC5X1JIrUtjmK13vNMM1GFCKg1V4Pn/95O6ictpNMpPDZjx24kCYo3
         odMRUkTBtmBwQc1lPv0JRK5HS2yyp8DQnckDG93t6VCWXClJbW+flCgjIv2+D6pSq//F
         +msRpIb+G93gp1T/1UEB8Zr7kVJoD4Q2fsURNEdHz6Y6pK6ob/6Es2eqRc0aiGT3BqH0
         mw9/fkqwW3l9QUt0m5roAbJo8KuIZPSojoF6WbekujMtmj/s3X08Abrjz5aJ+ZwjCju/
         8g7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739214682; x=1739819482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRdLgzD1wD3MEmKM8GjV3bFdVy6SihSEQKzMmUmzv9E=;
        b=gG3ytZy7wNaX2ehlKexx0F6xgR1LEg7AFyJIrcYvRSFK2rBBi0iTTni5VnK17rqosw
         8t+MVCba59TYZcaCVdcAEZL7wQ8d7eKN2CCQLkcS6nn+9rAPv12RpWeXDXK3TZgYnmSO
         9i898fCUu22ZwpZrw3kBKwa37wmPM7pK2EgeWzrgxIb7OJA/I6+O6z7zpzX1b+BSJ3o8
         O4GJCDtjBKc0LMfPZKEe7nAQlotn4oaRJ77SUeJ0faBhzyjo1isUIDSIGVhxJZUF+u6W
         VDnIwMsmvTkPPlwdf5FEr+VQVZu45L0OKX+5G/UePJEajHjF++49ub58x+sgAuVHiXym
         COzw==
X-Forwarded-Encrypted: i=1; AJvYcCVv7JQVvGGXJa3hYODR5giqXnR5FK0B7HiBwrltToyG2NDxNbemGVypWuZ7EWlAvnQ/wHejYTYnn9wBPj4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5KLEJgMJDs/IUc3tmn+x2eo6YWXLJFczqQAQNL3mVdFv3fZMT
	HOZw2IZ010BOqf1R4D3GxBfcqgPCE5JnTHVDEI8v3pd6d0vL20tz059v/7kUJH8=
X-Gm-Gg: ASbGncv31nciyjzEDB4e7o1b2CEVj3SH/AOuEp5Qoh6t7BJkay/H/eVAV9e/hiXHHu+
	NtDKgo1un3vUhKeaS/N0lKGD4QCgnOvjT3NTQuImE+GL5ZVweS4/K8NrPN85hqXKuzaIBkBVqj1
	K0+aIu0pKl2jsmMoz77LtQo5Yj/LNjgTwQAP3KXhkjh8PAOyktM4YZ0lKTxTpjwwO/4kSinzuEq
	SPfzHZnnF2rtw7TjhZhPQ0Xgag6V6UR/P7tr6l1Nh6U9xwHwp63OX0GFHtrQ2Gastac5xyK0lNn
	epIa13vdRPEa/xT8zofY7PyfoC+7lbJRXsgBiN8iPaJFWm2NnDnLXtZXo2OS/uCfHlAXHTBjQ9H
	Y465IXo1Qhpbhzpg=
X-Google-Smtp-Source: AGHT+IGhMqK5v2fSt6EV9RNWf/Z5VkBUx+UNoSTflx/SUbiE5SXTICj9mdVUZA6Z3mG7mSkQBoQAnA==
X-Received: by 2002:a17:906:4fc5:b0:aa6:79fa:b480 with SMTP id a640c23a62f3a-ab789a6b504mr1707903766b.10.1739214682515;
        Mon, 10 Feb 2025 11:11:22 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f19d800023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f19:d800:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab786aa2c60sm812424766b.102.2025.02.10.11.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 11:11:22 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: dhowells@redhat.com,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-nfs@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] fs/netfs/read_collect: add to next->prev_donated
Date: Mon, 10 Feb 2025 20:11:18 +0100
Message-ID: <20250210191118.3444416-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <CAKPOu+_4mUwYgQtRTbXCmi+-k3PGvLysnPadkmHOyB7Gz0iSMA@mail.gmail.com>
References: <CAKPOu+_4mUwYgQtRTbXCmi+-k3PGvLysnPadkmHOyB7Gz0iSMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If multiple subrequests donate data to the same "next" request
(depending on the subrequest completion order), each of them would
overwrite the `prev_donated` field, causing data corruption and a
BUG() crash ("Can't donate prior to front").

Fixes: ee4cdf7ba857 ("netfs: Speed up buffered reading")
Closes: https://lore.kernel.org/netfs/CAKPOu+_4mUwYgQtRTbXCmi+-k3PGvLysnPadkmHOyB7Gz0iSMA@mail.gmail.com/
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
David, this seems to fix the bug for me.  Please also check if we need
a "donation_changed" check.
---
 fs/netfs/read_collect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/netfs/read_collect.c b/fs/netfs/read_collect.c
index 0d95cdbe5611..681b630b4f06 100644
--- a/fs/netfs/read_collect.c
+++ b/fs/netfs/read_collect.c
@@ -284,7 +284,7 @@ static bool netfs_consume_read_data(struct netfs_io_subrequest *subreq, bool was
 				   netfs_trace_donate_to_deferred_next);
 	} else {
 		next = list_next_entry(subreq, rreq_link);
-		WRITE_ONCE(next->prev_donated, excess);
+		WRITE_ONCE(next->prev_donated, next->prev_donated + excess);
 		trace_netfs_donate(rreq, subreq, next, excess,
 				   netfs_trace_donate_to_next);
 	}
-- 
2.47.2

