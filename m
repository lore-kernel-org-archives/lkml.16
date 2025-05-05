Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B9A1624DD
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 01:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746409327; cv=none; b=EoM+oLsXg34axyVkWAzT5SFsA1KDkjjMyl9jwa6akyrcM1YWtSPP3MCaxvJeOn+TotvDdaxQof99OHhCOfyJkqTcIko/NmyjTv68OHiAjNeU+5jaAnL8p0NEFVx4gTRPN9MW817fhfUkv8r8rHcRHWnO4n3tNs8wvjspaYcanxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746409327; c=relaxed/simple;
	bh=SY8CAM9OeF8ktq8ifAB/JtKbJafayb06D+V3NnAUTqg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Q0JOk80Q6Pz7IM8OCJVGfxh+K/6XRbUPHmSDrhh7OZjdm6Zn5KP7jvwoBkMwkZZYQD6bRzoryssKKYnf6flr+cmgVkuTqrGJDEMy+uJQJHNfirIX5URX2yH6TTb1BfIq6VRgWb4jvPvy41RXTt0aUpAYkHUcq7ZTlEvhxm1Nbwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d458e61faaso39294675ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 18:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409324; x=1747014124;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SY8CAM9OeF8ktq8ifAB/JtKbJafayb06D+V3NnAUTqg=;
        b=rUApRDZ5WerTV+Oe5NU1/CNa8N/b93DKYuFu6usqaYX1GMnJHOOdNbbMAwM4TnfmaA
         H3pNtHDKt9TkWET+a+h6brQ5fvxp74CdqB1/lf5bu5AMxLv7iRlLi6p0/DiNy33KCH5n
         lAS1Bc9xA0c2zwGuAzkzrSQpKUh7pkj9MiDYqIkLjIHhN1JUnIJGze6gxye7Kjue05jp
         E6vz7WIKTwc4ZBOGNlj270t+HbKJvN9+2FBZ6KNvPV9Au/W4TJstXPVYplpZF2hMAbw9
         ZtIl/Deb39DYDSuF9NMWCUQdolYDFrIiWfVDUVOUSv0RRhuYaTvj71WE9XnlILv7Re8l
         xxig==
X-Gm-Message-State: AOJu0Yxg2+b1i9t/LaIFJfqAx4WfCt8e09S6Ie8Ps3pYPGPeQzCCNWL1
	TjlDJaFRNoopbTWGpLI4HeC/e5sNDgqcRF6NyQ6TMHcURaswU7cfdXlozh8ztwrLTF+p1S0C8qv
	TuEO2rMOttaDA8cO5GbQXzLedp7jE/ewnfQcKGZ/FU+KcEd8n9rr+vwU=
X-Google-Smtp-Source: AGHT+IHupjMVxzmUz/Ex60/EHK23VpBlpVhF2lhNNuKthkfVi/33zDEh+/ijyP59qBLzG5ohTJ8GP/H1BgNRXBRqZhB0I92I3wQe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:156c:b0:3d9:43fe:8e34 with SMTP id
 e9e14a558f8ab-3d97ad891bamr108789335ab.1.1746409324771; Sun, 04 May 2025
 18:42:04 -0700 (PDT)
Date: Sun, 04 May 2025 18:42:04 -0700
In-Reply-To: <681515d6.a70a0220.254cdc.0007.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6818176c.a70a0220.254cdc.003d.GAE@google.com>
Subject: Re: [syzbot] KMSAN: kernel-infoleak in i2cdev_ioctl_smbus
From: syzbot <syzbot+08b819a87faa6def6dfb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: KMSAN: kernel-infoleak in i2cdev_ioctl_smbus
Author: praveen.balakrishnan@magd.ox.ac.uk

#syz test
