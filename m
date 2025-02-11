Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93BA1F2389;
	Tue, 11 Feb 2025 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266274; cv=none; b=nHgf8xdxLUh8gtJ5YarSV+7212qpdki9WhVqEkoa6SmXk0xWuiSCNivZMzDII9QmQ9g0qk+k6x953HGlfwADE0kDr3Z0thjKk/QQhgSk9UYhtzhJOhgF4vX6b9nRCH2EmETTK43sE5H6imxXahtp7Q5ojnciIZms7+TylefaT/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266274; c=relaxed/simple;
	bh=R2tr/teNelQFSdpQQ6Fd/3FuvFlm5oXSb2ZRFJZSpJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p+O5TOGuKvVfDdq1/w8mWf0YYUzC+AQBikLUzAABmwW0TjPkOyNlZiwcpVzGpTXVGzWkTeQlYIcD0aTasyn+lTK0+snxpKVFwsdPh4Q/SEK7r6RC+lQY5ZiH8A3ivnQ/hUqEMn9v5xDfDZb/kifiqiyPN2NDQOWEhQx/56sYD6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASlbUGug; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASlbUGug"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dd93a6f0aso1755031f8f.0;
        Tue, 11 Feb 2025 01:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739266270; x=1739871070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+dUOtNF+C14dt6CUe7Af3ir1c7oAlJYy1GBvcUH+r4=;
        b=ASlbUGugCJ7jwCracsBSa2FthAQftJj7qKskYMhDv212apwlSqh7ajL23q5kQ2g861
         YndkxA+N/MOuquddWiSW2ilxCkqrRUXDbWNv79fMKpIre/uWGoUJNhSzGwhif3yOtI0n
         ZyvfQZneJ7UKHjzRgnKZLxNIYpBrZOTi+7z52P12CVz816V4zZ4c7fkVGIQBpdzWJIew
         joc+CFDT6YlzjvEliNgoxZXCVyWYzcv9h3dbxO2ot5ueR9Oq0/2VInwnDMkxfdtJHDur
         PXGhi4AR9bey7NZxxnndLpFiwNAhvtn1/ByQk6dEoDdb6ZatUcsBmEI6m/B+MtKksxU2
         yqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266270; x=1739871070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+dUOtNF+C14dt6CUe7Af3ir1c7oAlJYy1GBvcUH+r4=;
        b=HPpEvWxmkZlyRkCr5Vb5PPhOTbv9lzDskgxXoRB7ponLcSDAQVW6fp7FFzKFBdKITK
         3mAvdeqY4RDBE70C2d4P1/cdSImDRqqbpN7BUCfM832pis3FLfzRRAbqetTJYnTsqdAk
         5Q0K5xvo351s4fszpWD+L1Hf8yKDudhhqvUfXfbls0BDRRXeybRteBcIxUiCvqzQ1sJ7
         cmfvOxwbOj2yE0ykUfdwPel6uQ4iqxFrM0KJpARWcUJU+G7JfbI0CQgHkWww/fWTxA9/
         Vqpnja58ujRFzq4V8p2/lv05C2jPGPp4Iem2jkExm0g1OZvgGPimWjGv0LA0jWfrksBI
         poaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOvc7Rox79m5+qDr2BNtScj/sounvjqhlBhUxHw8NSPB9d6l1vV4Jodldje8Icg2yeyhR8rFBpGdmwSM0k@vger.kernel.org, AJvYcCUPdYwv8zQ4o+XnMJ5FgThEzrn6YLyOaYwwq1a9xkJMta6BC2BmewnzkpunlpMbx8T1ui3Yil6xnDa0hywsByo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmq2R6DyvPaYXTAAU9LXDtlryTV5zfr21dBdyfrvGQYHLlMODB
	lsmfZKnaMonB04WLQtZZopmA0TxuzxDIzeVBzy1dZSfhvszfBiAy
X-Gm-Gg: ASbGnct5a++WAiIH1rHqKhBlB3Y/rxM2tq9OvcMLdtaBskrQJHNsnCXHhhJNx9AfCkH
	mRcZUbP8xj9SX0gI5IdWWq3ule05SQ0c72rVWcQzPKPoj/pEvKjRZ0YJ+GrSjF5PbU1c0Cyscmb
	X0uCINOTR0xIWJYQNDozugDsthz0zaqmlUBDqjhiJKKjK7c6UF5IEyOQ/2Sd3Qr47FHJ/B4iyen
	WeSZKdDOcpTp/DuBKpzJjmhRv5sn5wQuiRBs0vLcUDsvp3NQymbM+IY5M6QZE76rR/t8xxJ7UyA
	PzA0yUS7zlo=
X-Google-Smtp-Source: AGHT+IGayxZEPjkNIx8NHOIpTQ+ARq27YFxquSiUQkxyiE8ktL4jjrfZuqpz08fiAnwGa1TzO1vOwA==
X-Received: by 2002:a05:6000:18af:b0:38d:e6b6:508b with SMTP id ffacd0b85a97d-38de6b65641mr771345f8f.9.1739266269484;
        Tue, 11 Feb 2025 01:31:09 -0800 (PST)
Received: from void.void ([31.210.181.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd07fa80csm10152873f8f.13.2025.02.11.01.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 01:31:09 -0800 (PST)
From: Andrew Kreimer <algonell@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Andrew Kreimer <algonell@gmail.com>,
	Greg KH <greg@kroah.com>
Subject: [PATCH v2] staging: gpib: Remove unnecessary TTY_LOG expansion
Date: Tue, 11 Feb 2025 11:30:13 +0200
Message-ID: <20250211093051.15993-1-algonell@gmail.com>
X-Mailer: git-send-email 2.48.1.268.g9520f7d998
In-Reply-To: <20250210121552.33455-1-algonell@gmail.com>
References: <20250210121552.33455-1-algonell@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When drivers are successful, they should be quiet.

Remove the unnecessary TTY_LOG expansion.

Suggested-by: Greg KH <greg@kroah.com>
Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
v2:
  - Change commit message/body.
  - Remove the TTY_LOG line as suggested.

v1:
  - Fix a typo in TTY_LOG message.

 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 85322af62c23..b2c4d1d26f12 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -542,7 +542,6 @@ static int usb_gpib_attach(gpib_board_t *board, const gpib_board_config_t *confi
 		return -EIO;
 
 	SHOW_STATUS(board);
-	TTY_LOG("Module '%s' has been sucesfully configured\n", NAME);
 	return 0;
 }
 

Interdiff against v1:
  diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
  index 1c3e5dfcc9ec..b2c4d1d26f12 100644
  --- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
  +++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
  @@ -542,7 +542,6 @@ static int usb_gpib_attach(gpib_board_t *board, const gpib_board_config_t *confi
   		return -EIO;
   
   	SHOW_STATUS(board);
  -	TTY_LOG("Module '%s' has been successfully configured\n", NAME);
   	return 0;
   }
   

Range-diff against v1:
1:  779e59d74722 ! 1:  463e7000d1a7 staging: gpib: Fix typo in TTY_LOG message
    @@ Metadata
     Author: Andrew Kreimer <algonell@gmail.com>
     
      ## Commit message ##
    -    staging: gpib: Fix typo in TTY_LOG message
    +    staging: gpib: Remove unnecessary TTY_LOG expansion
     
    -    There is a typo in TTY_LOG message:
    -     - sucesfully -> successfully
    +    When drivers are successful, they should be quiet.
     
    -    Fix it via codespell.
    +    Remove the unnecessary TTY_LOG expansion.
     
    +    Suggested-by: Greg KH <greg@kroah.com>
         Signed-off-by: Andrew Kreimer <algonell@gmail.com>
     
      ## drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c ##
    @@ drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c: static int usb_gpib_attach(g
      
      	SHOW_STATUS(board);
     -	TTY_LOG("Module '%s' has been sucesfully configured\n", NAME);
    -+	TTY_LOG("Module '%s' has been successfully configured\n", NAME);
      	return 0;
      }
      
-- 
2.48.1.268.g9520f7d998

