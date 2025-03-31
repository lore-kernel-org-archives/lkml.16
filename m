Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C22312F399
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743391353; cv=none; b=ldYIE8a4gBNTu+VvV65Gv2yDrYcX0tEWH54ZQkw3GrvvE02J/Kds1Quj5vUt0DBoGpqgbHpq4qf52orB+NGrVlcWYKjXjGRalkrXbtxkOT7yjoSzURVohUtqfCyZ3T4GHdEg/jJF9aC7zAYsWcHxCtAtSsnwu9/lrTnNnMtKY/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743391353; c=relaxed/simple;
	bh=DJYht588chhOshnh/oM01PQlP9cicgLlbkkCnh6ie10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TqeAZtJPqQKJI7bb7W4cHcnoQ6GtMWHP12JkZOFr0VqUplegkN38HXlr7OJ4oUSzls9Wxk5KPN3lwTEz1dsXRJDbxYcFGtGnCQF8ct3dqnJwEciNKY2mdTTQoOOOmwEMtKCqft00NLhUdrLzdbsoaZzd7pUbmaORZy+q/PEwb+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JEwFdcXb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JEwFdcXb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743391350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DJYht588chhOshnh/oM01PQlP9cicgLlbkkCnh6ie10=;
	b=JEwFdcXb4BArWGTfnD66tLS2NLniPug8c+GfVlIKCyX0Pyal/Ej5qMxiy246hnHuwrifTc
	5NSJBFshaxssi3LlV4mGg66NuA3LDzdmgFAVioTdEaD04rCeXW+TG8mrevPovsJx/Cj5/7
	xVqQnvPjQNfNmQiOZX2kOH9hFrrnPLI=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-3L09IBzDPYuHnqBVdWCNgw-1; Sun, 30 Mar 2025 23:22:28 -0400
X-MC-Unique: 3L09IBzDPYuHnqBVdWCNgw-1
X-Mimecast-MFC-AGG-ID: 3L09IBzDPYuHnqBVdWCNgw_1743391348
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d5da4fb5e0so23149985ab.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 20:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743391348; x=1743996148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJYht588chhOshnh/oM01PQlP9cicgLlbkkCnh6ie10=;
        b=peTClvn5wZEY4NmyLolgCE4YKpr3Z+cVGRiZgvPyrXHXD5ZkHnu9wccx20/dO+tbRP
         7QREJa97/4Tz0xtovUXi73ElMFTNzlmUdFt5KzUnEusnl3FErfrqAbpAH1hqvy8hCXoF
         MZ/h1cGBou6Ps71Jo7KgiA+lbNi+7rcJwkCXbOZ/KpW+wLsEYV+HWY9wDcLReDNho368
         Ns40x6hXzaHbUM+ikcFQzzi7co5xMhvMfUs+aF+MFwtn+e0n9Q8KvyqLZDSW8m71spBw
         hryJyFl6fRjbsV71dMQnpfzBah/8TLwOf0MIe+u76RFq+RftQoSrXi6FQRvR7Zaq17Zz
         FqYg==
X-Forwarded-Encrypted: i=1; AJvYcCWPJdTztgjVw4nbtp6xXMWDlFgDn7dAouCJudMsEUsnD0Je+Rvf8Kk0RXU987VA85rjckvqt4lZbljfXc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YydiKRiXtj6EnPxooLKh+aYZWtbmMPH5ewYi9p5dJ07roWyEJn8
	UaWQ7OAG0cTPrhskRtiUwvCi2gen2gykFswnhKka2i/yOSVWV0ZA0xH9aMt+no2uWKCbSUd8ell
	p/+2PgJvFI54it/avxBh0mXsu/ibRtBSPWIIBuYqOKXipiLkuqIb9DKSoUxN6xQbvwwaKkrayya
	0o84Q0xrxuxZ3qlBH4DruUJT2b+aBPGju2xL/E
X-Gm-Gg: ASbGncvZSWUqMScX1x5Lr/SUjtrWy3vQiKFPycm8zotcCEEJdD11SbCJ3DbCxuw1fkA
	eJLPS1TIa07qF7mRR6xAiCWS3P1aeOQwMIivAaTO4Na4/mq1rQOhb1CN9gyR1zDgaRSSfh3GqFQ
	==
X-Received: by 2002:a05:6e02:17ce:b0:3a7:820c:180a with SMTP id e9e14a558f8ab-3d5e0a093b2mr79161045ab.19.1743391347968;
        Sun, 30 Mar 2025 20:22:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzaH25Vzm7n70KpLV36fle/W5sj7NSSdA8hJmo754X2wtwvaPhuyZSC58LigxxsFYAU0bQlbQf86JZovKBAVI=
X-Received: by 2002:a05:6e02:17ce:b0:3a7:820c:180a with SMTP id
 e9e14a558f8ab-3d5e0a093b2mr79160885ab.19.1743391347656; Sun, 30 Mar 2025
 20:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z4WFjBVHpndct7br@desktop0a> <Z5bx7ZHNcyc5fM_L@darkstar.users.ipa.redhat.com>
 <CALu+AoSSKh=5ELgQyzDrGEDm5fm2XKteH1ZC70mm89pNSSPMHw@mail.gmail.com>
 <Z-c7V2hptt9U9UCl@desktop0a> <Z+dQZozsbdls6yqJ@MiWiFi-R3L-srv> <Z-hYWc9LtBU1Yhtg@desktop0a>
In-Reply-To: <Z-hYWc9LtBU1Yhtg@desktop0a>
From: Dave Young <dyoung@redhat.com>
Date: Mon, 31 Mar 2025 11:22:50 +0800
X-Gm-Features: AQ5f1Jq_A3xmC-EmSPquFgYtTSaWdlNOr-d-et357PEEYRDXHWaZEck-6AeRlpk
Message-ID: <CALu+AoTrPZS7ukuLsCTCwKNKVd8=PUN8nXwh9BdicyV-==-W=g@mail.gmail.com>
Subject: Re: [REGRESSION] Kernel booted via kexec fails to resume from hibernation
To: Roberto Ricci <io@r-ricci.it>
Cc: Baoquan He <bhe@redhat.com>, ebiederm@xmission.com, rafael@kernel.org, pavel@ucw.cz, 
	ytcoode@gmail.com, kexec@lists.infradead.org, linux-pm@vger.kernel.org, 
	akpm@linux-foundation.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> With v4.9.337, kexec (via kexec_load) + hibernation works.
> With v5.4.291 it doesn't.
> I'm not sure how bisection could be done in this case.
>

Not confident, but maybe you can try latest mainline kernel see if the
below commit helps:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a2498e5c453b3d8d054d77751487cd593332f8c2

I noticed the e820 export is different for v4.9.337 and v5.4.291

Thanks
Dave

