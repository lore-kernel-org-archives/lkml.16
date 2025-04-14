Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7C7156236
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744656130; cv=none; b=owoPOuDF9VJkSul+JL6fokqN4vPw1CvC0XfpTira0qqQXD5j/iaLd5qCnpoTAyUpQNQ20zy0gxSL2FufUfKU3IQRyhW1RAftqIJz5AIJNjzX9/cKCuN1ego/rfbLVRntw4g51/Esl9kDmizfMHKHR6TjWUTLupz0B+1iVbCWkoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744656130; c=relaxed/simple;
	bh=jsFptswUmeSJtX6rTryRDrID87DOTelrBduenEncJL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYgJsOznLRd8UviFb930HP3ZhToJq5cyCI0750PjUE9CnjmBXi+aD8vGYI9Kn7aNrsN8hVeD7ZHbJ+oL/1qPEWCJpprZggFgfym3IcnUKdCl10YirKNKEheyUtF7s0TYFJAN+9sJpCfXZwKBLDAHDp2JYN4iU9RIy1/L065fwv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uOMHbypO; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uOMHbypO"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47686580529so49701231cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744656127; x=1745260927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVj63pLHPDOADttU5mk9xoBgxj6+KEfzLF7NO/zyIHU=;
        b=uOMHbypOAzjtg5SrSTosxoZXY8+EGqyI1UKtgfpbLsg5RlckaH5C6jY23Z44cG+0dN
         bCuJaB4xARojZ/h77WOmEWxSTYhFHVBXW4TuwE6QV7VoneTCJCvrTpLmrAc8z/0dLo/w
         lFNHqMh9bprTNVjwTJWm/IDHfeyeygPuKupSghbZ9lQKnu7wkVA46vJ9uo6cMWk2qVlf
         3cLTBgncMDBMtLBYG2wWdK5Oj9Bre5puSMEkf/27DWVEiFMAPznDcomd5j2EH803/V0z
         6apNiTygZtKsD55rNci8KcFU1ceOzsH4vhVk+VUk9toQ5k5EXrhY4XzsFapv4pG1RMj2
         m1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744656127; x=1745260927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVj63pLHPDOADttU5mk9xoBgxj6+KEfzLF7NO/zyIHU=;
        b=oqCArM8LfYDWPhf3lvZFKI8fNogZFNTDVOrLFwd9c6kDxoYbKHB8HeufWXhsgTx9Qr
         rMuQcmOIX39mkBA8mw1PYKXi5G3vh0pveOG+LD2tY3cIiqs8tIHbVXrwBWRpA349IR85
         2LOw56S2gFjsg6skQ54SNf43GS3Is3LmS4PQ162foGL4PaFpI4SrUvd72EMrGQqZHdby
         6Gepflbctpo/k3qcYfpNLMgKZFYbXHgQRXoWrdQGYergx7Q5lx7MhZ5pVg0s5v+S+iXE
         EqKE/9bUdUf44E4uIVxJKgfnz9fiKY3j/dCpUYkU+sNi6l0YOTPsDegxotoOAyPetcCQ
         vzDg==
X-Forwarded-Encrypted: i=1; AJvYcCVcouqltIFV5P5jYPzkEfcWUHRm2i4YP+FN7QTcOtnYArT5kznsimW0hqT2AlchZNX8e10hV+UgFeLIFVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHBhPeRuQoQwqkj9mGQFiYM1y01o9UnmBELG7lmg1vhACYsuUf
	p/5SgwoBqrgS/e+3fv8blgakU+AHiRXND0Qb4MjzF3h7Lpb+T06tc9Hn7WPp7eMGbXX/aDDd8+U
	tlyQPBpZEmkWXtvn7TmIIPnRre2mHFOU128n6
X-Gm-Gg: ASbGncuuiiCqBC3X4rRHAS/EyLbr4VY7kavsw4sMuAE1PtZNf6ySERaGqWc0gzPdFzg
	dmgkbizz3vOBFn6JJSnDZjoEau9HNRI5qZOlyhBmo3kAbRiuUIO9qZvjcjfWqj3oqe4nSza7gea
	ezBHqt5W3oDKDvfUJ0JHs7TD/lEwlcx1wfnFVXtXWXwYdbvamsxqJv
X-Google-Smtp-Source: AGHT+IEM2908mcWzVKMjpolQ0hIG1B9gw1c/6MnW5biuy6F3HJ9GSftRvzmu/S4TKHnQCd3lqvgWhDveMpG2O2LCLJQ=
X-Received: by 2002:a05:622a:250:b0:476:77ba:f7 with SMTP id
 d75a77b69052e-479775d5ac4mr205613591cf.34.1744656127177; Mon, 14 Apr 2025
 11:42:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414-double_hold_fix-v5-1-10e056324cde@narfation.org>
In-Reply-To: <20250414-double_hold_fix-v5-1-10e056324cde@narfation.org>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 14 Apr 2025 11:41:56 -0700
X-Gm-Features: ATxdqUF7AI_OOcycjc1SsjBq1YuDR9GVzjAZt9KIbXpqOALRRD2LjaN3l9RR8PI
Message-ID: <CANn89iJEFq4QeFDSq=-7NdPnqPgwMJDd5xvQ70YUEqHjNjdchw@mail.gmail.com>
Subject: Re: [PATCH net v5] batman-adv: Fix double-hold of meshif when getting enabled
To: Sven Eckelmann <sven@narfation.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, b.a.t.m.a.n@lists.open-mesh.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com, 
	syzbot+4036165fc595a74b09b2@syzkaller.appspotmail.com, 
	syzbot+c35d73ce910d86c0026e@syzkaller.appspotmail.com, 
	syzbot+48c14f61594bdfadb086@syzkaller.appspotmail.com, 
	syzbot+f37372d86207b3bb2941@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 11:05=E2=80=AFAM Sven Eckelmann <sven@narfation.org=
> wrote:
>
> It was originally meant to replace the dev_hold with netdev_hold. But thi=
s
> was missed in batadv_hardif_enable_interface(). As result, there was an
> imbalance and a hang when trying to remove the mesh-interface with
> (previously) active hard-interfaces:
>
>   unregister_netdevice: waiting for batadv0 to become free. Usage count =
=3D 3
>
> Fixes: 00b35530811f ("batman-adv: adopt netdev_hold() / netdev_put()")
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Reported-by: syzbot+ff3aa851d46ab82953a3@syzkaller.appspotmail.com
> Reported-by: syzbot+4036165fc595a74b09b2@syzkaller.appspotmail.com
> Reported-by: syzbot+c35d73ce910d86c0026e@syzkaller.appspotmail.com
> Reported-by: syzbot+48c14f61594bdfadb086@syzkaller.appspotmail.com
> Reported-by: syzbot+f37372d86207b3bb2941@syzkaller.appspotmail.com
> Signed-off-by: Sven Eckelmann <sven@narfation.org>

Reviewed-by: Eric Dumazet <edumazet@google.com>
