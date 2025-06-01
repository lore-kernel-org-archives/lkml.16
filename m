Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4882A1CA
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 16:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748794864; cv=none; b=I9nU8jvLSQEoxjphRkoOoW0lSzCogtJGUiM/OrK815+fynIS8fjM35obhhW9452i+fwzxUYbLFqI6RC8ZyR5MG1hU3lEuu88ViLeYMB8H4LqUN+94Cqa+w6LqFwoAk/KeE5U8O0bfPvstWGBL3r1xnQY10pbIlxjUA9e2SvePXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748794864; c=relaxed/simple;
	bh=h6QoMpVGGZVy60Ef1tMLb7Ks9v3/ZkdGVQ1zpckE/E8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EcVo7w+XgHuuVtapSu57UVy76HO6zsY0vnlnADyGMRAflA8Q5Xdppbm1E2gI1CwYuL2HgiS2FyN/8oWB55pbant7kAFrSP38QEAyhLw5X+d0M970h5rlLPPzXsg7WMuoBxmxVffvUUvmTtP0IvmOb4Ds8UWBYIDYfmyskZawx2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86cf74e8b87so512810939f.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 09:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748794862; x=1749399662;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BxRCzM24gglLIr7E2yldOZZAcHs1wVBwC6JZOlmfhD8=;
        b=EtotPPYyPB/8W107ssoGomCQYGWcCUVzcTAbpF/ThXEAQIhaed8GEqDonewa0OENHV
         AX5lHva9lBuK4NC6XcWpY0iOByvBrd+TBIdg5ydm7av6zFIYKKXJPYQKhzc/4TJqMdET
         9h3dMSQ4vjj1oCXcTwwZFR/x8fk0ePBXtk4/GxHRecIpqgITJn9HeAdDBHaJ1/Nn2AX6
         oD9jLfyp8gHgo5bsAuiMIfURBi/wePFLRUxXxaaOfeGhKnuyayJbOj/0sns8DWNcZbbG
         P5Ndq3CwL0iWqi67kJbjr4EwAuOvxFMyUWwLTK0tV7DLxgb18zIbtaGHe374a9QG5fJO
         m0Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWad/Nuod7fqmZ04fWXvybHfvvwLxg95Sb3uhpRM01+an7JhuuDdO1/BZ189uPkSxVs3h41s31/IgqbNh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNbbQRKFgW8GHMUjaBna6m98db8b3DOZafSUX0RT0UxtfJn849
	2vb5EUVIBfDkeQrhPZQi10kYtgVZlH2px9Qdu5DN4etRTfR4lrI+OfBn6KVzIRp8kDIt7s6Qmqm
	5Tqd3t+/oMZ22uHrAJDsw15ZOXtJ2pMzQSaOPllwQmN+03pLUra+fcofT+zc=
X-Google-Smtp-Source: AGHT+IE6dM+Sri1ig2zWdcwsj1cdNpnH6D5Ew7GCODMXRc5foiZExQDqXF9qiWibFIJGCE3VMwNQPSukaY5jbkheuww0vE49Df77
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aa6:b0:3ce:8ed9:ca94 with SMTP id
 e9e14a558f8ab-3dd99c2898cmr107808385ab.14.1748794862401; Sun, 01 Jun 2025
 09:21:02 -0700 (PDT)
Date: Sun, 01 Jun 2025 09:21:02 -0700
In-Reply-To: <6751e769.050a0220.b4160.01df.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683c7dee.a00a0220.d8eae.0032.GAE@google.com>
Subject: Re: [syzbot] [cgroups?] general protection fault in __cgroup_rstat_lock
From: syzbot <syzbot+31eb4d4e7d9bc1fc1312@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, andrii@kernel.org, ast@kernel.org, 
	axboe@kernel.dk, bpf@vger.kernel.org, cgroups@vger.kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, hannes@cmpxchg.org, 
	haoluo@google.com, hawk@kernel.org, inwardvessel@gmail.com, 
	john.fastabend@gmail.com, jolsa@kernel.org, josef@toxicpanda.com, 
	kpsingh@kernel.org, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, martin.lau@linux.dev, 
	mhocko@kernel.org, mkoutny@suse.com, muchun.song@linux.dev, mykolal@fb.com, 
	netdev@vger.kernel.org, roman.gushchin@linux.dev, sdf@fomichev.me, 
	shakeel.butt@linux.dev, shuah@kernel.org, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org, yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit a97915559f5c5ff1972d678b94fd460c72a3b5f2
Author: JP Kobryn <inwardvessel@gmail.com>
Date:   Fri Apr 4 01:10:48 2025 +0000

    cgroup: change rstat function signatures from cgroup-based to css-based

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12ca4c82580000
start commit:   932fc2f19b74 Merge branch 'irq-save-restore'
git tree:       bpf-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=50c7a61469ce77e7
dashboard link: https://syzkaller.appspot.com/bug?extid=31eb4d4e7d9bc1fc1312
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=161cdfc0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12dfc8df980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: cgroup: change rstat function signatures from cgroup-based to css-based

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
