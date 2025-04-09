Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3971D618E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180750; cv=none; b=ABYf8+Jv3fmW7mmxOS5X7vtv1Fn3lBUhmmsRkF4oH492OPh5ZfmwZRzbJZI1W2Gb8yToVzacF9enWVIYfyOdanNyuJ9sHWqlhA6C2j2ac6IzvL5Xx3jQ9+LKRgmljbz7u9iBfCH7q8Bo/EBcYcqHrALMzoJ78T1aGxxrF4POtmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180750; c=relaxed/simple;
	bh=85+fq/SHz+kksCPTk+dS0iaspsSTyWX1d22ri6BCfJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mdDFukDeasQwGlqmmZQ1ucUZHxEdXTS74gDX1104TteJD8w+yTuiIuAGr1pX551DUo8YynKky1Lpnj9qHxWRuoKjIqzgISqNxY+mN7TLt1SoDxAYszjFTe9NYCtkFAUIUc8UUJZBiqkmYQUIiLUcFkx9kxA2HrN3UGUH1pT/0FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=mvu1ORbk; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="mvu1ORbk"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7399838db7fso398058b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744180748; x=1744785548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=REThLuvOX2aW+MFvPUaKntweYlnj+QZ7XWuk4zsUfTk=;
        b=mvu1ORbk130gbYto4fZv0L0rtvXlbOYy2bApJr12PrWv5M1JBgKe2E35v1DGU3rlZK
         WGS3UHUUPga42pK1IBtBE72VYbtiCyg8jIzdnFt9U7iDUs1xUrDyYEe/PnhlfzxtnLFU
         DwoOBc7geXeyCampt/7iqmlRDLV2IlFmhX2pzamZVvW129jglTHZzJxrQ+Wu3aFwiXuz
         j7oqDSVjDHe/86A67BPOV3U5ne1TlA/q+rz6VPogSIEAM8MB7ZzKBgu5MrDYmMKun/sg
         4MOlRj6Yj6Iohu8a4iqXU3slTz/6TGW0HPivYggnVH2n6j08xxpviiXd8+vHVBjsAXWC
         nqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180748; x=1744785548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REThLuvOX2aW+MFvPUaKntweYlnj+QZ7XWuk4zsUfTk=;
        b=BocPYrq3+Xefjq2NcneM6KhDrhUEBp6YMg5EEP7xznl1+fO5oeBnRJQAFKMzGCJxKV
         N5E7cQGVPhdIzFE+C1wGekARZgXHMX3oPedHzfQ+/2iZg7Jo6Gr2hDqMgvyLFZDFUJBl
         EYqwhpGsCpjQqAJyaTY3NTsQNWY6YVs82lIQQ6Hc9ltzz9Ijnw09Jo1aM3zqqpeX+nO+
         UXo7caMBEapvdUvrn86AH+V1FyIL60BUaHgNn2VfaHOmRcqRbrmGAfnkP5ZZME/Dyz14
         BDx3g2LidgrJce6aPqemLcshBymZXfZpLJeMttFIMQwTnU69iTVq2j/eX3iTBwX/YEcu
         Jvrg==
X-Forwarded-Encrypted: i=1; AJvYcCWRbUdQEhRnSkwWZ/hxAg31heop3OqCOTacZ7Pz5Xk6k9YDlQSWtW+pA2dP3tshvJWW5aWNwcjGy+JKSAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWWkcRepGSfz287UkAWiNN8XC/dHANPb562JLVYzFcLCrsTrIS
	Y3JTYbWWI301qrHym1NKhUhA9vA8Cngz6QLUEKBHmHXIUmcdqgkKxUHp7e6X/w==
X-Gm-Gg: ASbGncu0ccLaqvyMSY8V+UtvNvBzc26szd7JeWnR6aktIdG5EZ8XBh3wrlyNPjToXX9
	BxjkU9PN8Om5YTgIpISo559EjA0GFvq+FY1/NdDqT72wqIxp08wFG/nrVmdfbSqMQJAGbDx+xjv
	S5LUEJuVVwe0Bq5FeOjwSYkZrmtdjuUlBwHuOma1/8EcmoSD8WcaUvXckt+YMxBJEFHVCadniE4
	5Q8B84Te7QjrJIwaw2ZdRMCtHHT5i1NGbPn8wv1iW9LPuWc/DMg3FxwSnPbsax/z34xMQybNrGR
	2gDywEfUcLNSmeCrflVBDfdkPb41hZpR0l7IgRSYNPHoK34MNIap/s6r+6VfHNM4GClPN4JoMkb
	LEZmB20VAwf2np46L
X-Google-Smtp-Source: AGHT+IHHu3D4Kehb5gNefB05hxiE19K926bGtF+XixFaVskCxYxHws2z42CfzD0HsSgVvUbFihELbg==
X-Received: by 2002:a05:6a00:949c:b0:736:5813:8c46 with SMTP id d2e1a72fcca58-73b9d3d3187mr10389791b3a.8.1744180747832;
        Tue, 08 Apr 2025 23:39:07 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d68baasm505745b3a.73.2025.04.08.23.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:39:07 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 0/6] staging: gpib: Removing undefined CamelCase functions
Date: Wed,  9 Apr 2025 06:38:58 +0000
Message-ID: <20250409063904.342292-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch reported Camelcase routines in gpib_proto.h. These routines did not
adhere to Linux coding style and also were not defined. This patch series
removes these functions.

* Patch 1 - Patch 6: Removing undefined functions

	Reported by checkpatch.pl as CamelCase where function is never
	defined.

Michael Rubin (6):
  staging: gpib: Removing function osInit
  staging: gpib: Removing function osReset
  staging: gpib: Removing function osSendEOI
  staging: gpib: Removing function ibAPWait
  staging: gpib: Removing function ibaPrsp
  staging: gpib: Removing function ibAPE

 drivers/staging/gpib/include/gpib_proto.h | 7 -------
 1 file changed, 7 deletions(-)

-- 
2.43.0

