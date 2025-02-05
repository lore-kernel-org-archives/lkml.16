Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2461215CD74
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768484; cv=none; b=SFzhMdM2wa4r/qxO/cejtDv+qAIt0oBTo/Q9pOMvWvTNad2xg0eoFo5NpETGwHNG0z7b4ZaSBpgQ1OOvvgyKBMjOzETHUcFcM3lYfT/ATk70KhPd9Z0THqSpuBrSa15GxKn+cO3uMI5U5a1xR3rAumgS9MCdjcdo/2UY0jbRn14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768484; c=relaxed/simple;
	bh=+gTj1BAOP24vT4TV4X57y7cUp2WzqJzucUUVqO1EGGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOYGU6xCklXX9+sDb0LFaWUbvj0MxntA9zr+1yXVYN/Rwl2U/UyiV6fBUiiVuFV4oLyq/rV8m2yhXEpjQbVfInbsl+O2rLg5NnoyUZCoMAYv5D4Pj4tbRTuQUf8Hf9g5NiH/JjsWDEKmSTNNJKLSVK5yybJo9qGeb6jGvFGuesc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D4u7AvBE; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D4u7AvBE"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d442f9d285so19948a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738768481; x=1739373281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dMhcmmKXbkc9E9Zmt8e1XybJHRzURBxdji1raWTTyk=;
        b=D4u7AvBEHcMsAg5nzytSKY1gaklnqd1/U1j5HFkztlXqze8loDl1Y0hz97TXXvy5nD
         5+BbZa0lb7zta047lttpaFVOpwvaWP0SkhzWQ/ertByBLOh/BFptIZxYCDxqSp1HSpAW
         uv9c+tQ2lvTXsSLZdrBRFxzh1ZfdxJt/drMLUEU6NrmlchAVioaS+lYqH4osxbQHepV4
         pj1oP14dnL2QeZ64eaWBu0R1x/fucoASYAcdbr6pclAn7P/FcdVeQxQN0ojqOaMMiWog
         kI6721dF2GNMCKwUGj/Hptotc4KI8OByPLjyui8HDX/cF2etH+vpkxo0tUlPU38eqoPO
         /c7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738768481; x=1739373281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/dMhcmmKXbkc9E9Zmt8e1XybJHRzURBxdji1raWTTyk=;
        b=GiXOkBomkG573TTlUPYhvJCgLJUi+aFwZ2euHa2+n2BGDOiypfi4NnIXG086Zypg4E
         lj14cKQ6FboSe+1aMwPEnvsZnoM34fW3SgICY3N20fL8pf8TYX/Z6jGUjxS6DNG2ubCQ
         1TXS9xHQM+FoovtRIQ0KVxXk17uUwAI6eBwoNmylQ+Jzuf8fg3UGomfjaPDp52OptrC8
         l8uITmQA05wCNtgjGfgWjzeIU5flhxtmjVAAgoVHmAPJiJVHkK5oMuNaN2E6TdVtbaaO
         nVzjBfADy3Dh1Dp8+001BB456zYIFakI+aQKqvBOMryiRIxe3XNCn3KMuSkRamNc/4cL
         U1NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGqnciQrbkfJrI6C7uHsvuwT+slf8lyv98Bc+BUTSBo7v5tuW6IiaczCFHMa17i9G4VAD2ddg6b/rLaYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzHioxEft44p2lrnh4mYWtxKgGozlqoKY6i41dWsfIEE9FvDH8
	NsXiHoQ6RMjweKdsLXXJYyzJE/3Uu+z+pH97xverACPa//1vrK3eTtRDqiPYskeNY/Ds6s57W9G
	PBG6mDTHCOedDlIGOWxnLhPAEvSwCPBd700/T
X-Gm-Gg: ASbGnctk4AJYq5Ik4fpa7hzSNdg2WO+bhN+Ru+uuFKEgbCH6P+zPiMMTKemq1fnIHXI
	nmfSbsfO2Ck1ONZEbP2hKRXYcyDtlIyZqkQyOVfFmHvB3fjLEV0MYVdcYqAXpP7CeG4lgM8mDKD
	0MRpJ6bNj0yyh03PCrTiuqxxnVPg==
X-Google-Smtp-Source: AGHT+IFP5s9LbxKzdUpVw6KOT0JD6CsduCiKeNhMgjR7o+3gGXORG6BzK2yeXtY1W6lfrJuWkXWgGynuoHAumc8cwgw=
X-Received: by 2002:a50:8d44:0:b0:5dc:59ca:8f3b with SMTP id
 4fb4d7f45d1cf-5dcc3e5a13emr241751a12.3.1738768480785; Wed, 05 Feb 2025
 07:14:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67a34e60.050a0220.50516.0040.GAE@google.com> <9fc6212e-0f1e-435f-b7e5-72058f7fd6db@lucifer.local>
In-Reply-To: <9fc6212e-0f1e-435f-b7e5-72058f7fd6db@lucifer.local>
From: Jann Horn <jannh@google.com>
Date: Wed, 5 Feb 2025 16:14:03 +0100
X-Gm-Features: AWEUYZldxeCbX_2Dy0eF8s-3URd_Gl5OD0fUnrqVhNYFKmDuQAtk5qP25TCS9eg
Message-ID: <CAG48ez0DYnDKikFUrPQOppsW_-aa2_hcoyOcRJeCMRrEm6GVTA@mail.gmail.com>
Subject: Re: [syzbot] [mm?] KCSAN: data-race in mprotect_fixup / try_to_migrate_one
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, syzkaller <syzkaller@googlegroups.com>
Cc: syzbot <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com>, 
	Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 4:07=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> On Wed, Feb 05, 2025 at 03:41:20AM -0800, syzbot wrote:
> > read to 0xffff888114b41700 of 8 bytes by task 6418 on cpu 0:
> >  try_to_migrate_one+0xb5a/0x12e0 mm/rmap.c:2321
>
> Be super nice if these reports could show the line of code!
>
> It's:
>
>                 if (vma->vm_flags & VM_LOCKED)

fwiw if you follow the "dashboard link" in the bug report, you'll get
a version of this where the source locations are clickable links to
git.kernel.org at the right commit.

Also note the "syzbot engineers can be reached at
syzkaller@googlegroups.com" at the bottom of the message.
