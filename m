Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4ACFBF0
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613706; cv=none; b=aB3GKhEcDEfTfty9u32BU95aAW5+D6fa+tp1BRt2VoCB1jdevlD6bIedVHFpnoiQRgX5WRgeZ8tBuzsaqylui94IDuFqHginmGlV2O7x2jn63RpiUNciP37aywk1wdOEi97Fe8zpUM4+xAuDwygkoIKn6d/p4ehsoKdSYPAvwcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613706; c=relaxed/simple;
	bh=Vn8kTjaiavDdyc8/wlZpxrXePEbx3gjEURKJpd8Gq8k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=CgagLheXfj2HCjxyS2iKQfhkoWT3q0yfg/m6j1OnhUwLjXqj9GrvPPOHwAN/IxwI689H5Bcr5Gseloo5f8K87E8+QESdzfHl61JTfz9ZRCJbCmGV4LLuPQs6MOXsTp+LLcMGhY80lHbg488Qkpo5m7sH9dHzsTgtk+t9R1ACaTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3dc6e2441caso37703785ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748613704; x=1749218504;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vn8kTjaiavDdyc8/wlZpxrXePEbx3gjEURKJpd8Gq8k=;
        b=dUypfnnTgn/h7wiHj42INhDIW1aGaV+dafYOPaxOtoRkF0U9b10GPfcquwpkqZwSXQ
         tGYsRYlOoOz29YJ1/bar0y0auvjcREmkfJ9lNjnsT2QSWgfKgRuKhND7jg6GY6+QHAMy
         ML20SNx16i3/J5VBEd+p4aPujirSPQalfEEZxFb3tACF0NqlE1PD8p3hOFgDzU/zwQml
         HM3gxbR4W4Uip9jmuIS7vI3bpWx2bGEkYsomDCq6NzfrLoGi/30pnAIOnXn+G1mKK+jl
         2wVS7I3etlNkc3TWAJPMKm9Q4fpxT18s7o5g4laAODwXXqPEmra0ViZkGW0bnTDRkAke
         XkoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeZMVM65fN9zsOu437lIFwClYeLAdRyGyv22plBbz8QjSzFlE4xOexshcL0H2ASavFQspqSxlMfHm1jIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5dU9JBizPcd16TwyxL3k5Kiir+iccerKFF7e48C3qLpk5jnV/
	s0Y+iBoYd0o+b68H346GrRUsx7ElBHuuxV8/e+JajQju1BnDwV2BJsOW+F0K6EWCcoZqj9IXnfd
	IHJGjCDkRAzIBFZqb/V3LJc2iOsOdMhJoVoMTC5gVBK81J9mh655tSOruemM=
X-Google-Smtp-Source: AGHT+IFBKXKI+UTW3Wewp8O5r3iqEG4HPnHS9Zwm2v9QM43aF1ggkL2+SZ+rLZDAhRB5cNBYUFP/5Gs79D0ljMO5OpmKx5NZ9jQs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1987:b0:3dd:88da:e7de with SMTP id
 e9e14a558f8ab-3dd9cbd667dmr20346515ab.19.1748613703702; Fri, 30 May 2025
 07:01:43 -0700 (PDT)
Date: Fri, 30 May 2025 07:01:43 -0700
In-Reply-To: <CAMV7Lq5fOMQ6sfmU-rE5YLZO3QB71Gn0LpNUzN_jZvO1fhhh-w@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6839ba47.a00a0220.d8eae.0008.GAE@google.com>
Subject: Re: KMSAN: uninit-value in ieee80211_amsdu_to_8023s (2)
From: syzbot <syzbot+3d9e2c65bdd43a254924@syzkaller.appspotmail.com>
To: abinashsinghlalotra@gmail.com
Cc: abinashsinghlalotra@gmail.com, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test

This crash does not have a reproducer. I cannot test it.

