Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83608488
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743946264; cv=none; b=qCBMh/N6L2A7CqwNT5TsxWiA+iwMTAwUb4rqO/ZUNu5ozUD+Orh2bGsgAL07QU9+lCMzue8tQdS8oWvsiSSSEro8BRTWIepV/0Cu/7N/XLuWn31fNgfgyL/zJE1SpBDmNxtzDWTyXl2cODOdzKH9C5Sc/cuBNKlYxlsxgrgAv70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743946264; c=relaxed/simple;
	bh=FyCjynRA47mn0pUjepfHMQfOYT0IfKFifac/iBUAgjM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=crhjYNEMUeW2T+aPMAf8Gj/d2StXkK18BWe5E2GKHN68ysW+26cwLy24+wDjTOs9wqfwZiUyqbC4Ncp+m2v2SZeAlAZ7CMxYrx1UQG9Q/iWXpKWiH0Q9lG+Dr/vcmgwFkIm/wIS3i2mH6sQv7xYdK8O4v/ddv4sasHiOah3VHkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d6e10f4b85so61407155ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 06:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743946262; x=1744551062;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0Y5mkblPB7hNGkvpzm4wg+a6EjM9rmrDhLmS7LNNCY=;
        b=heh1inH5DIEIkgbc6i3YKz61WoYpG7pK+eRUt9KU4Sayxf568kMf0UeJ90obVFRDSi
         LXvJ+L1GI+QrX53GiWOrCj1bj+HsfTJkvfiynEF1dasaRiI2foVtJt1bCT/tpRWNtrmn
         PRFK+urvhuQAzadN03xtlz0YWGVVpktRD+gQYvz55tQBfiZTm5ZLjAk8VpTEeAk7Hp97
         bFzg3qsVEM8Mkc8OA4p6NCFmD/eaYOkBY1kzVjvS9DimfQOotFRRh4Lv4S72LhYcinKr
         4gdPJuSppZpsa+zMVGjtv8gFludKs6XLkoe5tKV7f0gxYGRrTYLVkLwb4Ll+wtcdIKtP
         26nA==
X-Forwarded-Encrypted: i=1; AJvYcCWzslR/q+hsQ1Pyq66H7gWU/8SP3wGzEXaPBmyYm+Qtc5kWXN+UzxffBAfZINPrvN6bnLfh0qn25zZ4V6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWBWtUeQHkhJN12dOzw/NNpnTF0sLjAbENn791KqJylHHJgqom
	svRWdVO5KQq+J6Qdj9fnCEbbKT/FjkFJvO00vbOvqO5yjoc+fIVPS1pUvomhOePMHomFdNhDoNF
	PraJCX0ez8DYdNI1z4s+t6fDY+1aIj2kfVs4zRXROHXCNYQ1gsEpWF8Y=
X-Google-Smtp-Source: AGHT+IF8UVFctTmC2vxyNN8r60tVGscuZqpdo+yEbHBc8Dw98Crwk3GhpZq67SzP62Ylj2xMv94PaCiaL5vymyRWPNRVhOCsuQmV
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:164b:b0:3d3:f7ed:c907 with SMTP id
 e9e14a558f8ab-3d6e3f65597mr98419065ab.15.1743946262040; Sun, 06 Apr 2025
 06:31:02 -0700 (PDT)
Date: Sun, 06 Apr 2025 06:31:02 -0700
In-Reply-To: <Z_J94Up33luYw6Xg@smile.fi.intel.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f28216.050a0220.0a13.0269.GAE@google.com>
Subject: Re: [syzbot] [acpi?] KASAN: slab-use-after-free Read in software_node_notify_remove
From: syzbot <syzbot+2ff22910687ee0dfd48e@syzkaller.appspotmail.com>
To: andriy.shevchenko@linux.intel.com, dakr@kernel.org, djrscally@gmail.com, 
	gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, jgg@nvidia.com, 
	kevin.tian@intel.com, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nicolinc@nvidia.com, rafael@kernel.org, 
	sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com, 
	yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git@bitbucket.org:andy-shev/linux.git/test-swnode: failed to run ["git" "fetch" "--force" "f7e55974102a831d64e9ca077790e9122f71f6c9" "test-swnode"]: exit status 128
Host key verification failed.
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.



Tested on:

commit:         [unknown 
git tree:       git@bitbucket.org:andy-shev/linux.git test-swnode
kernel config:  https://syzkaller.appspot.com/x/.config?x=24f9c4330e7c0609
dashboard link: https://syzkaller.appspot.com/bug?extid=2ff22910687ee0dfd48e
compiler:       

Note: no patches were applied.
