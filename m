Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73CB258CD1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151842; cv=none; b=pXBZUzLCvOvgVajduM5ytCi1wz2HX3LgDRJM5/gFY9VC46SGVOAR/dzSPD3wrw1WYHZwcdzQ4PLf5NQJoqehYrkOZZcf8CkIQWsk4SirsySRx9ABYGUcpDDtVsWWfYPWzRKwWJrCIDuI2nYQCdPwLLgth4PqcmKfIxn1wWR68dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151842; c=relaxed/simple;
	bh=Kue1YlVh5HQ6MZ9KbyBy0zFILN9rzFtinUOFKsVUXPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAlIu4eeFlQpjAHnZOBX6BRJrZyWLfHIUovyCcR6TJeF+VMFHl3FKLfrNii6iMULvf5WY1MJOf4yyKkK8jYDef4ysPCXALsTBSlsx5gcuAe2Xf0FIzA+x+AiijQXYMVRQWwkdqBUA82mJAcsR9SBkfFSOjoAPEMx5LnW5dLdod4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=EogeYUMb; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="EogeYUMb"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223fb0f619dso62025745ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151840; x=1744756640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kB2MgTLPOg3pPg2tpudFygtBvxmFhbXJLI5jNKtriLI=;
        b=EogeYUMbBFQfqpka1eIGPmtODDh+EqAw0dCUWlvx/FG8K/K5NBw18eDf+ikwuAU7px
         thBkumhI5Cnij36PayCHdFP/irlqsc5nDx/NCZt68aKfRUjcotin9+0h9H9anGNHbmxo
         qv2Hlsoj3vEgrKLC0zJn12uyT0WbjVB9/TYs/qYvQyoai54KsttF/DeQoXX43ZhVDXGI
         wK8NwnpqMYa6W7ZGTpcoIoKWp+oJKefuN5P1BKJK0m0jBhQ23Ffdu9UNBF0U8P8Qt1aN
         Z9gh43v1Qz7ma1FN/KD8xMkQJ4EcTP33ZM+DOf058lBq4UE6yacPKbPPS4pZrzE7A8vB
         lbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151840; x=1744756640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kB2MgTLPOg3pPg2tpudFygtBvxmFhbXJLI5jNKtriLI=;
        b=MVL4SEg25CiqSqy2yByDCh3lhbG1zrW7CVT2RVgPjqyivpkjvMG2i8waVf68JZzehK
         6msA1fW6LVTmR01+ZisXkbnGVZdnPIPX2dMfcgI6JFWNnzS0Vli+hR6+9YeAmE8qxCPs
         fZLVpTg0e+2Jxt9Ew9igdqS/VVQZCo5NYEDUSQc696U4ACqmvuwKlBW4kmvp6I2J+nap
         DkHHIabPdwHqR0+tpmPEo+NH55zDtWpppNsxr0i1DEtULNxlLZtCOvCVjajkZGUo4kkM
         T4p46SkSMOIFzrjFRCM3OQ/8WAJIKf2x736uiVfQf1gjDsHks3nr0UFujowpJHLjgEQR
         nn1g==
X-Forwarded-Encrypted: i=1; AJvYcCXPaRA7f1OYJhmxcbH5JS5doph+zZooMLU1c8dnCJPQs+FepGzkySdbYmIKNuCZi7W2TeJW98kaxAnrmJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGkT1zdBrAWQQtR6hszOePGjsT5nWQ05Dw4cN9WfEASnCjDnyj
	p8EhLwBwNTWRlQVWflasZWk70UDS9SEL/TewDyamOJ3fNQ8rvL/wL+k0UxXRvw==
X-Gm-Gg: ASbGncsVg2dJXb0oFMcnyV8OkpuE1NlpXnMMldmMrwCS5YBoiVU68Uo1dhS1VGob0Um
	3QYQjF/+gcnGjfE1pRkHCpS1QxFdqQJYiIGsoANntRsvCCSTUpxRPdonE7NjDnUXPzYQRT5RTLe
	T3fMekNlSqyYad8GxG+EIhefil8ZmIcKR7M4Ce1A2pJnYUQW/U/dSWYpgT5CgitepDcGa5kb3SE
	Qxkc+7UVzC0SQziykHfEW21nyF3rQru3xRX7WhrcRI+EmN73yP63LkVwAbDKpDGzZPoaaNv0pZ3
	msZYL6DPA3zgYWsrHO3YvVNAFhBuGefwrkqlp9VJhOelprga0D62JCAfB6sQQU2D/bYA0Q1ot/x
	oYgBQHhF8ng==
X-Google-Smtp-Source: AGHT+IF/LhpWwMnphsjseFvk30r3OAklQBg0/w4MfdfcQxpCTgbt/coJs3EOaBBq1W77mCq/aWFuVA==
X-Received: by 2002:a17:902:f60c:b0:220:fce7:d3a6 with SMTP id d9443c01a7336-22ac29ad1b1mr12606075ad.23.1744151840150;
        Tue, 08 Apr 2025 15:37:20 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785adaf9sm106830845ad.27.2025.04.08.15.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:19 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 15/18] staging: gpib: ni_usb: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:55 +0000
Message-ID: <20250408223659.187109-16-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 715848a3bb75..93975cd7e5b6 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -2198,14 +2198,14 @@ static int ni_usb_hs_plus_extra_init(struct ni_usb_priv *ni_priv)
 }
 
 static inline int ni_usb_device_match(struct usb_interface *interface,
-				      const gpib_board_config_t *config)
+				      const struct gpib_board_config *config)
 {
 	if (gpib_match_device_path(&interface->dev, config->device_path) == 0)
 		return 0;
 	return 1;
 }
 
-static int ni_usb_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int ni_usb_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	int retval;
 	int i, index;
-- 
2.43.0

