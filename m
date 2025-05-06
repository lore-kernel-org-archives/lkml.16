Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7882857FC
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746554244; cv=none; b=e0T31pd0GGJBXXyB2/BkN0s5hgfeE+8h2jE8hf9/xYYrgIc4rUBNJgFALYPTYRP/x/I5iqD7MzMg/QUtX3e0irr5XdbRJ+Oj89zEWqzXV4n9A0DLS9XzXGy0lA94WMgZzC0OHNxyI4zRB/8/WdMyBKNhyrh9FLlWWlQ9eFcTQNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746554244; c=relaxed/simple;
	bh=TDEQButXfv1aj9Q3tzx/qG6tDTloS2yb4zcY8iQPhTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hif3HxRGkXz2aOYZ8Wgf76yeVRniXRYMkTIvh9IXw+gRgsyXAhK3cyejwMkrmkMa+O8w93fl+oxk2XCP2k08qryFHK6XySR7uRotY3liEbfq9hfMe/j9Xu0Q38+zhpYfguRAuU/Y8hGJcxz9mdYqRO+3m30C4mVXKzL+/tFdRT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sTIrEd/B; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sTIrEd/B"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d4436ba324so52436765ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746554242; x=1747159042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDEQButXfv1aj9Q3tzx/qG6tDTloS2yb4zcY8iQPhTM=;
        b=sTIrEd/Bwk6PNc3kO3RMrStHbr+fodTJnq+BaSySmXqiIwkmJHIMq1TwwU5GtPcd3e
         wN8FAZS3NfrdvbzGabCfupbzpsBa7NkTQaa/Q45+b/Qsm9J1lci95RAlBKLyRToL1LB4
         lvo9JKp1MaRAhdcvR1Tfds47uXGuAKYKpABD7eRDzLXo1E6GsKD2vjECXfivpPOxaogY
         oIwZXr/9Cbroe8CgCvtFOBFUCAG3E9JlqKeVbxtZq6cAlaWQHiGkAY9ZuCtc6l6q7vIX
         DIhZNJb7BEIXNLStNIrH/Flkv5HRHY1b+8WpDGIGWVO+vwhSPCfhxSAuL4jZpHfcj0U4
         i1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746554242; x=1747159042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDEQButXfv1aj9Q3tzx/qG6tDTloS2yb4zcY8iQPhTM=;
        b=CpJoJNP1Depof5Q6BxG2IvpRSUxXmbfgqA2TXPbYXWtYHtXjjcPQNJWbNrkHwME12m
         dKf0WRNgsiSaodPX5FCQNEJyPJd7FDmVKPv7AnnuOfLlUIxtRwWF1v2iKZB5cmo9dOIC
         V/fg1O/v49Q2A5j727fl3VzWc2MLCKbqZ8w8HTsy7LqOfZ59WKxb+uvu+4S39lTM3njl
         rjS0DhweJdUakbuJyTHGArrdapYmL8HbiyZjCiWSa7tGCTbEGG/GQlORYUv0ozPcDT/G
         WlTRaVe3lb3TXYTL/6wpSbfRxyGk4R3KCTLIU0qlSCT/CZ3ITtEzKQidijVX4JmrXhH1
         7NjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7QxMdWZU3TZNOQVdX6SbmD2d8ksYAlVw0A+C0NVdnTIYbTc9NWnIdZqyxoeN4zuPjkITO4v94klmZ/w0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3HXZPkMTTuZvsDp/0w9WW1sauK+2NtIHeuAPOAUHJOE0XoEAf
	IZtAL5gx7NoZKfS+xvUrzO84sMYFOQv1GjRGkzMIiD2Ai0upFHvaJc1KR2E9p4QRUMmgCib1PBk
	ENudqTgoSnqr7qWR2WLsZ5w244rIDCTYyaLaV
X-Gm-Gg: ASbGnctXiXtQHgp0zs2uZHYtsF5P4NaUb2wUSqWK+2M6HFF8JEMkKo48a9ipXCAiY5h
	SKnNgvgtiFEDSe0eS6Pm3N4mlqwhsFd/JoeG5/Zn8IrRCkZqWIwa9eacAuj0JdNumkY3axH2Bcr
	wlTkPBCcIa5Zu3dqtyLa8pzC5AFQDzYt9ZfQZ1GZbHse6xPWR6zY/yYAZNaEGBMg==
X-Google-Smtp-Source: AGHT+IGCZXgSSxGtX94Coy1Z7IBGImew8w0745inbqWEWkS+WvQgI3CPhCa8c6/8PGm2TCC4kwU0DgyogxMbp6nZpA8=
X-Received: by 2002:a05:6e02:1445:b0:3d8:2187:5cea with SMTP id
 e9e14a558f8ab-3da738ed70cmr108085ab.1.1746554241759; Tue, 06 May 2025
 10:57:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429234743.3749129-2-rdbabiera@google.com> <2025050116-hardy-twins-913e@gregkh>
In-Reply-To: <2025050116-hardy-twins-913e@gregkh>
From: RD Babiera <rdbabiera@google.com>
Date: Tue, 6 May 2025 10:57:10 -0700
X-Gm-Features: ATxdqUGhlDS5VHX3V_2l33LFj1BJLYgPbYIcE7-K8YutfklngATcqul4qM_jfcQ
Message-ID: <CALzBnUF7zb6F2iq_1xaF=1vbSkrpvPkPd0Ses0iWDG-n4fxHQQ@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: tcpm: apply vbus before data bringup in tcpm_src_attach
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 8:41=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:

> Does not apply to my tree, can you rebase against usb-next and resend?

This patch is rebased against usb-next/usb-next, but I think I do need to r=
ebase
against usb-linus. commit 8a50da849151e7e12b43c1d8fe7ad302223aef6b is
present in usb-next but not usb-linus, and my patch as it is now is
dependent on it.

Would you prefer that I rebase against usb-linus and resubmit given
I'm submitting
as a stable fix? It looks like the conflicting patch would be up for
the 6.16 merge
window.

Thanks in advance,
RD
