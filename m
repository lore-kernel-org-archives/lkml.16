Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B872857F7
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294176; cv=none; b=FBtPdli8sOXW7wi3thKREm88NRfAZ61ACpXOKdug6pE3nY5T7NCeeOI+FJgoX4NXPwPTgP5z1d6+qyo/sUWskEmQ8IuaFHui8ee0RrQdwWJpajnrMXogUPKB+87eLTJIyco79k4q+a8sX3v2wlKzOvY/giHzH1UCKLacNTA3fZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294176; c=relaxed/simple;
	bh=iJ7bqgXfPtMBXmUDY/YhJ+N8O2D9Z1dGk3Blw7bpjMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5qaefPXZ4fXSKcaxhZelEHHWYXcty8rBG/ptmd0+Pb/4rqwf5mSEazBRvqv+ouusT9NFv1UObE4Kw5J5x7/tt2SdouNxLxAnK2W3B2P/3eiN63UJXlnyExaJ1IUm1vImDmdWUnHTc68tSDO8A1OWif45xkmrhyWK6ITy18fIDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dDeqjcsE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dDeqjcsE"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso4846451f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751294172; x=1751898972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmutXua1lSKxORl0w3oIEp2FOLuV8/Za8RV+I5tfNXw=;
        b=dDeqjcsEoTAmg0IuTWbaXRAn1R6cYoIF0wgSIJTPmR/pdJWxOxJfaPJGVpaiEE8vkb
         mjycFblwzxfOi4MNggsUz9W5AzoVIdan2A0Ze64WIPBU7dS450G1/7X1NZItsl2npyAc
         UUh1rt5pVqM64qCid+fm25rXv4TMLfhb9ANEJE/jmBu9XzMbh0yIi5JEW17QMEbuLqUk
         I0g+lnuoh1xHmPRhR4rL1c5C6NFzRJxd6xboq4oUqukZruN+x5gE6HYp1ol0wxTwxD9C
         d3YbKkbtDgvcr/mQSJ9SaN5JAEl8/cr72LtEmo7CR+opSQeqnY0ZLCN61mYtzq15DDyy
         xa7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751294172; x=1751898972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmutXua1lSKxORl0w3oIEp2FOLuV8/Za8RV+I5tfNXw=;
        b=C8CN118FE25oVRCl8DSjLz2BTuafdUwVegtwyc27u7iSJg8SeKhB+MRxh/9LIIn0Uo
         YnQfHs0NjCPxH6/2USFpCQ5Ik/5r2Vy+Zg5aPk2dM6jRDeDgt7t5BKW4oCRpyvT0zN5b
         45LsRW7r8FvaR2+1hZf9cjpV/LlKesfyhc5n/R6RKC7XGgrgiIpURKEV/EMiP+vlDGaT
         sGligHem10CHaFd4Hlm+1+Lm/4gmPcCsk00wxsWkwpdUiraJvRDK65dHbWMxnxWN701R
         L7OYSbDkgXEZc7v7Qn8yBn0hQDnShwMDWpPmMDHfbPdBpaFTIYhtewagchJ4NqfBwymw
         P1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMyrws+rYbbC+iL4+uJOYxl//WGt0Tvum9QEGPpESRykG4JGxDflFgq7fKPZjOPbtLnuP8tHHbJM/HbOE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+FWroJRTjPM0vgTglRMSm8C0MHV0AVVmWN8xY1nfJLfSEZNT4
	FNqKvfmlLdqt7FAQPrMwWP1+SMF36SXj4lJViHHA7Fyt4bUnK+mDSOTWvPNcOnpyMw70935OM7N
	OhRzha74=
X-Gm-Gg: ASbGnctcxA69bPYzyQjt3+a9Jk8wfe2gQC9U5UxHsYlNi2tvAxaSsqZgybly+WIhlyY
	vDhjoM37trG7aLuTX4XMRG8fw+/CCbEN3+7jgFESJ9qbILXHl24aKMl+jvtpWq0Igpl0YpeQU0Q
	SIrepRY5lZ/aRv6aclelNZMLLuIqLkk6EVtcmEpcWcROaHp5gZvym3EV/V+MvP6jIbjRZd1XAgA
	HSDeGGMBL8wi+Tm9qrtNU3MgHQp/WvR/YjE29jVWz6267hRNII/w3xTEZnf8khLS7oNf+ZvAHwM
	bPF6HShUf0RZg0U1gEyV26xrnLUymcF9KjmS4ZHGRrT/+6XmXHNCJ4Ra/W2mLw==
X-Google-Smtp-Source: AGHT+IFeTwmcYHOYYLMQoffaVlLFKMuHfFzsJq4UbYAwtBydXgF3vYE5RuiejytIxEYKIFATVTkqYg==
X-Received: by 2002:a5d:46c2:0:b0:3a5:2fae:1348 with SMTP id ffacd0b85a97d-3a918281259mr9014396f8f.51.1751294171768;
        Mon, 30 Jun 2025 07:36:11 -0700 (PDT)
Received: from zovi.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4064b1sm139691695e9.29.2025.06.30.07.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:36:11 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] module: Prevent silent truncation of module name in delete_module(2)
Date: Mon, 30 Jun 2025 16:32:32 +0200
Message-ID: <20250630143535.267745-2-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630143535.267745-1-petr.pavlu@suse.com>
References: <20250630143535.267745-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Passing a module name longer than MODULE_NAME_LEN to the delete_module
syscall results in its silent truncation. This really isn't much of
a problem in practice, but it could theoretically lead to the removal of an
incorrect module. It is more sensible to return ENAMETOOLONG or ENOENT in
such a case.

Update the syscall to return ENOENT, as documented in the delete_module(2)
man page to mean "No module by that name exists." This is appropriate
because a module with a name longer than MODULE_NAME_LEN cannot be loaded
in the first place.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 kernel/module/main.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 413ac6ea3702..933a9854cb7d 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -751,14 +751,16 @@ SYSCALL_DEFINE2(delete_module, const char __user *, name_user,
 	struct module *mod;
 	char name[MODULE_NAME_LEN];
 	char buf[MODULE_FLAGS_BUF_SIZE];
-	int ret, forced = 0;
+	int ret, len, forced = 0;
 
 	if (!capable(CAP_SYS_MODULE) || modules_disabled)
 		return -EPERM;
 
-	if (strncpy_from_user(name, name_user, MODULE_NAME_LEN-1) < 0)
-		return -EFAULT;
-	name[MODULE_NAME_LEN-1] = '\0';
+	len = strncpy_from_user(name, name_user, MODULE_NAME_LEN);
+	if (len == 0 || len == MODULE_NAME_LEN)
+		return -ENOENT;
+	if (len < 0)
+		return len;
 
 	audit_log_kern_module(name);
 
-- 
2.49.0

