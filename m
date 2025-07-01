Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AA821770C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 18:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751393813; cv=none; b=paQvnh/4twPq264rtV0Q3GoGrlnUPcOiIH1hK+AYnoKEyb+afu9vyqtg12DcpbT/DxwLaOeXeK79HWnNSB9mjd868u1tXU6hq/4Io7nws1Mr0dyqENRjkVKKwGwlSGGbi7s1OeSS5nR0zBdFe9yWHdSKqiJ660VzZ28Cb3EDAfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751393813; c=relaxed/simple;
	bh=CZ0NCzjxzxouCOdjUmt3Ky8n/GDGlu6VzPDofLvuiXI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hR+tYvuMMDp2DKpXn9AJT+voRpDIc/DwEveRUDhnQNTAdOBJiJ2oJ8fVWJ/p8BHEJKLOZsUTu2CdUbulaFhTRBXgJQ4XWEGwUWtVvFWkqDmHtQEhXAcWE0Qbfd/H/27ZVUhqE/X6R5TiMgcDOOnAj1v5AP8Ana1ZksoR1dcJDgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86cf74e8b87so1070114339f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 11:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751393810; x=1751998610;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CZ0NCzjxzxouCOdjUmt3Ky8n/GDGlu6VzPDofLvuiXI=;
        b=QQpkFlrtl/r5TAaZHSbb8jtCERnkIH/GPAe3o4GmTr6EVh1KPOfijnmIyQHpCXLsY6
         T4odLBT7W9s6I6xYBXpVwRzov1TK8FtyhOYcUPKVhO8w7PZJJRBv73kbGVc4paUAaUVU
         hFtvxSs2gzaAdzdSECk2cNciznRJic63qPo4s1I6mj9JXTU5WEBFvGXOIa1H5skR+OdT
         QWJtKoHrGJ1HSyKIVkMvoPDnmGINjGitCPHFQcGu94B3UMej9zJ6szgZtnfZ7plU0tdu
         38QcMuRWYBoFAKgGb8AvoSUu5150bDlyIwxUwGtuGaBQHg+63lkXD2Kr5YYtAvxfluYc
         Zzyg==
X-Gm-Message-State: AOJu0YzfkHVIyqargkDDLSRp/WYU0Xnq7wadaTtoES7DE30k1t75LrXL
	MbvGpTu4vsoCgu27FiDfVVBGdHwrpYcS7MRl2DjgPTevC/3zcr/DWzUIJBx0jeX4IZJgayKzu15
	LLM75hnA1sMaqS16nRgXg75beDZmefIfov+OULcIYO2SD0f/OX9+B3V/fjGs=
X-Google-Smtp-Source: AGHT+IE0dY0vLNyRTU61rU6boF4Cu2qhLg9b1atY/uxZRQnBKwd9dlsDDjRT7zuSqGm/cmfPRuT4mtHw8fM2qDy00HyeLU9Hr824
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a5e:da41:0:b0:869:d4de:f7 with SMTP id ca18e2360f4ac-876c6a9a86emr14967339f.12.1751393810784;
 Tue, 01 Jul 2025 11:16:50 -0700 (PDT)
Date: Tue, 01 Jul 2025 11:16:50 -0700
In-Reply-To: <685ce019.a00a0220.2e5631.0206.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68642612.a70a0220.3b7e22.1f08.GAE@google.com>
Subject: Re: [syzbot] WARNING in _ieee80211_sta_cur_vht_bw
From: syzbot <syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: WARNING in _ieee80211_sta_cur_vht_bw
Author: moonhee.lee.ca@gmail.com

#syz test
