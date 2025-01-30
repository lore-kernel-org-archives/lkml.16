Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287C91953A1
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 07:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738223896; cv=none; b=rqLyjJVBdxaUN4KRzS6++yPEv5o4A0M+v1FFP5PkYrJRV2YaxYhhWF2jF4ZS4Ksc5IW613IMHw0LtMTzi19PEnO1gerTqFHNsEv9wmpwWXVS3/0a9RSQuQFF70VGWlIdyx3RTwLiYZ9ilAFS8ll+UyiJwPJF7szI6L6isQireGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738223896; c=relaxed/simple;
	bh=ud20V6QcRGKAvhDwAyQxiR+SaarhmXAASLV/SlYpMvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VgnrGhzMtxB3fzn78cz+qx5JavY11UZEA0rMZAR5YN8AK4GsaMiAJJH9ROeLG5QgO+Aaz7sG5nhKwUWzsRe1FCZBeOz50DRbucp24lajmN6+qLqz//yHNa4yTAC4n5OR6OEvHtpfQHNn+l6AQ9zF+Ny9CU1hoOiREMDygPlNJkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=Cbc3pIJe; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="Cbc3pIJe"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so782300a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 23:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1738223892; x=1738828692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuVbeCxd0ZLjYqubDflCtwEntaz5VobEV+1D/OC0S9k=;
        b=Cbc3pIJenBVO2tztWrzp85DAQOEqiBr/zgraOcg3SEXMuq1HkLjKSrEqhOg++5m1zX
         2ONxhOFFjgWRO9GfZVdSxbBId6SCQ36Gk00f8pILwPzk4yDHJq7RZmIN2R6A1VdhggfU
         /uvxnmgf4XcPS50Kuzz6akgjxsolpj4zs+GGEHIdRMRW/oQDcBAzObt9Wz0oU6gRFnpd
         +B4s9O8Eu16zbH5sBXsR8VHsIjLO0zPH0xpM46cjN/G3O3gUjmHtBhBbuGmL/KT5dx9S
         OF9yY81pebz7WFVb0nEmT9F30vRRxKnPW3wafYik/aUAR4RM2kfOisbZwfBKONa8MOEX
         15CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738223892; x=1738828692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuVbeCxd0ZLjYqubDflCtwEntaz5VobEV+1D/OC0S9k=;
        b=ngBfVlDkxUESNTNz8cyzEx63ZCeCo9q2b+fId+Cpvtv5EMjcrHwZMJsFzWU/F7pj7t
         gON73hNbgqtdNCux25+n+7Cngx4SiB1TH4YFRCRs5UH3pXpsZ0cxH9LDrqAyDBU8dIAp
         ASkQdMR3rgbyyFHQcE1INdid9B7bUgS4tCcRNKuGBjLrgoGcONYjdfXot+Xc0Wr8+tuB
         jbnFTBcgghmAhT4BnBpXtatlu+F0p8VA/+JaKrAlF5rcHoFdhQv7aMCRM1tpmFsNeIez
         UBBENua4//l+2MMtGwesZr4GT5vWCP1uUGrCrWtsbisXziCff1XqkaZTqO1+qw3di+gq
         X8Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVUuQ20GqxLypMV3avGzPmh8HGKnnNIVVMyRRCiod1MvdT6q/yCQEMQMuRllsgTEVB4f5dBcDGxP8DG3M4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw+48PG0PvV4wvs1T2l8H+6v5pQPzGtHljzfvfFPhbAcOB9mq6
	YtbscEzlC9Wv49KPhpWoytNB7WaTrVVWzpKCswPchkZjDFp175CX6qCrdvi7b1IwxGicYnuAp99
	0jj2oLzBAfni0hnbzX5T7ChWuai2f+Igj3F8fcg==
X-Gm-Gg: ASbGncuWHKpwgqA9JrcUtXkxFIUQ3zf16YUtyaAGE4/S5R4aZgVBAz7KcAiQdkpG9AU
	IToV5w17mUPmn9APWeRYswwbOXEQBJtSVDtdatP2DRcjw7i6kJC9qLve6NHWnrhfJaRNhswzDSr
	OjstWriuAizyY=
X-Google-Smtp-Source: AGHT+IEu5lJQlOicODKczVeGYUaXZ9FX4E8/+oKNod2zLD4ot+JEbvh8Y3J3ZdJXFjEPZknUYwrYq/HGPzvpTbHvk+w=
X-Received: by 2002:a05:6402:2346:b0:5dc:21a9:d0f1 with SMTP id
 4fb4d7f45d1cf-5dc5efc07c3mr5580642a12.14.1738223892155; Wed, 29 Jan 2025
 23:58:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z5cgWh/6bRQm9vVU@debian.debian> <6797992c28a23_3f1a294d6@willemb.c.googlers.com.notmuch>
 <CAO3-Pbqx_sLxdLsTg+NX3z1rrenK=0qpvfL5h_K-RX-Yk9A4YA@mail.gmail.com>
 <6798ed91e94a9_987d9294c2@willemb.c.googlers.com.notmuch> <CAO3-PboS3JB1GhhbmoJc2-h5zvHe-iNsk9Hkg-_-eNATq99D1Q@mail.gmail.com>
 <679a367198f13_132e0829467@willemb.c.googlers.com.notmuch> <CAO3-Pbpxt9K=mT3ozFqMHAQcy0B30snxq9Kg9xvP7pmzmXP5=w@mail.gmail.com>
In-Reply-To: <CAO3-Pbpxt9K=mT3ozFqMHAQcy0B30snxq9Kg9xvP7pmzmXP5=w@mail.gmail.com>
From: Yan Zhai <yan@cloudflare.com>
Date: Thu, 30 Jan 2025 01:58:01 -0600
X-Gm-Features: AWEUYZmOZY41-_m8tByw1qpE3RBZEagqOtpv0-Bq3dYhzbDRQJv54tOveKY4Feo
Message-ID: <CAO3-PbrUw4XM0-ns=L_TXP=m07bdr22DGO6gJ=gAYWOoJ32+qw@mail.gmail.com>
Subject: Re: [PATCH] udp: gso: fix MTU check for small packets
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Josh Hunt <johunt@akamai.com>, 
	Alexander Duyck <alexander.h.duyck@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

v2 link here: https://lore.kernel.org/netdev/Z5swit7ykNRbJFMS@debian.debian=
/T/#u

On Wed, Jan 29, 2025 at 10:48=E2=80=AFAM Yan Zhai <yan@cloudflare.com> wrot=
e:
>
> On Wed, Jan 29, 2025 at 8:08=E2=80=AFAM Willem de Bruijn
> <willemdebruijn.kernel@gmail.com> wrote:
> >
> > Yan Zhai wrote:
> > > On Tue, Jan 28, 2025 at 8:45=E2=80=AFAM Willem de Bruijn
> > > <willemdebruijn.kernel@gmail.com> wrote:
> > > >
> > > > Yan Zhai wrote:
> > > > > Hi Willem,
> > > > >
> > > > > Thanks for getting back to me.
> > > > >
> > > > > On Mon, Jan 27, 2025 at 8:33=E2=80=AFAM Willem de Bruijn
> > > > > <willemdebruijn.kernel@gmail.com> wrote:
> > > > > >
> > > > > > Yan Zhai wrote:
> > > > > > > Commit 4094871db1d6 ("udp: only do GSO if # of segs > 1") avo=
ided GSO
> > > > > > > for small packets. But the kernel currently dismisses GSO req=
uests only
> > > > > > > after checking MTU on gso_size. This means any packets, regar=
dless of
> > > > > > > their payload sizes, would be dropped when MTU is smaller tha=
n requested
> > > > > > > gso_size.
> > > > > >
> > > > > > Is this a realistic concern? How did you encounter this in prac=
tice.
> > > > > >
> > > > > > It *is* a misconfiguration to configure a gso_size larger than =
MTU.
> > > > > >
> > > > > > > Meanwhile, EINVAL would be returned in this case, making it
> > > > > > > very misleading to debug.
> > > > > >
> > > > > > Misleading is subjective. I'm not sure what is misleading here.=
 From
> > > > > > my above comment, I believe this is correctly EINVAL.
> > > > > >
> > > > > > That said, if this impacts a real workload we could reconsider
> > > > > > relaxing the check. I.e., allowing through packets even when an
> > > > > > application has clearly misconfigured UDP_SEGMENT.
> > > > > >
> > > > > We did encounter a painful reliability issue in production last m=
onth.
> > > > >
> > > > > To simplify the scenario, we had these symptoms when the issue oc=
curred:
> > > > > 1. QUIC connections to host A started to fail, and cannot establi=
sh new ones
> > > > > 2. User space Wireguard to the exact same host worked 100% fine
> > > > >
> > > > > This happened rarely, like one or twice a day, lasting for a few
> > > > > minutes usually, but it was quite visible since it is an office
> > > > > network.
> > > > >
> > > > > Initially this prompted something wrong at the protocol layer. Bu=
t
> > > > > after multiple rounds of digging, we finally figured the root cau=
se
> > > > > was:
> > > > > 3. Something sometimes pings host B, which shares the same IP wit=
h
> > > > > host A but different ports (thanks to limited IPv4 space), and it=
s
> > > > > PMTU was reduced to 1280 occasionally. This unexpectedly affected=
 all
> > > > > traffic to that IP including traffic toward host A. Our QUIC clie=
nt
> > > > > set gso_size to 1350, and that's why it got hit.
> > > > >
> > > > > I agree that configurations do matter a lot here. Given how broke=
n the
> > > > > PMTU was for the Internet, we might just turn off pmtudisc option=
 on
> > > > > our end to avoid this failure path. But for those who hasn't yet,=
 this
> > > > > could still be confusing if it ever happens, because nothing seem=
s to
> > > > > point to PMTU in the first place:
> > > > > * small packets also get dropped
> > > > > * error code was EINVAL from sendmsg
> > > > >
> > > > > That said, I probably should have used PMTU in my commit message =
to be
> > > > > more clear for our problem. But meanwhile I am also concerned abo=
ut
> > > > > newly added tunnels to trigger the same issue, even if it has a s=
tatic
> > > > > device MTU. My proposal should make the error reason more clear:
> > > > > EMSGSIZE itself is a direct signal pointing to MTU/PMTU. Larger
> > > > > packets getting dropped would have a similar effect.
> > > >
> > > > Thanks for that context. Makes sense that this is a real issue.
> > > >
> > > > One issue is that with segmentation, the initial mtu checks are
> > > > skipped, so they have to be enforced later. In __ip_append_data:
> > > >
> > > >     mtu =3D cork->gso_size ? IP_MAX_MTU : cork->fragsize;
> > > >
> > > You are right, if packet sizes are between (PMTU, gso_size), then the=
y
> > > should still be dropped. But instead of checking explicitly in
> > > udp_send_skb, maybe we can leave them to be dropped in
> > > ip_finish_output?
> >
> > Not sure how to do this, or whether it will be simpler than having all
> > the UDP GSO checks in udp_send_skb.
> >
> > For a "don't add cost to the hot path" point of view, it's actually
> > best to keep all these checks in one place only when UDP_SEGMENT is
> > negotiated (where the hot path is the common case without GSO).
> >
> I mean ip_finish_output is already dropping packets with length larger
> than dst MTU. But I guess it doesn't hurt to check it also in GSO
> branch. Let me send a V2 later to address it.
>
> > > This way there is no need to add an extra branch for
> > > non GSO code paths. PMTU shrinking should be rare, so the overhead
> > > should be minimal.
> > >
> > > > Also, might this make the debugging actually harder, as the
> > > > error condition is now triggered intermittently.
> > > Yes sendmsg may only return errors for a portion of packets now under
> > > the same situation. But IMHO it's not trading debugging for
> > > reliability. Consistent error is good news for engineers to reproduce
> > > locally, but in production I find people (SREs, solution and
> > > escalation engineers) rely on pcaps and errno a lot. The pattern in
> > > pcaps (lack of large packets of certain sizes, since they are dropped
> > > before dev_queue_xmit), and exact error reasons like EMSGSIZE are bot=
h
> > > good indicators for root causes. EINVAL is more generic on the other
> > > hand. For example, I remembered we had another issue on UDP sendmsg,
> > > which also returned a bunch of EINVAL. But that was due to some
> > > attacker tricking us to reply with source port 0.
> >
> > Relying on error code is fraught anyway. For online analysis (which
> > I think can be assumed when pcap is mentioned), function tracing and
> > bpf trace are much more powerful.
> >
> Totally agree tracing is more powerful. Time by time we see issues
> lingering for a few months get addressed in a few days or even hours
> when tracing is plugged in. Unfortunately at least for us, the number
> of people who can trace properly is far behind the volume of problems.
> I can only hope in the future more people will recognize this as a
> golden skill, in addition to current standard skills like pcap
> analysis.
>
> Yan
>
> > That said, no objections to returning EMSGSIZE instead of EINVAL. That
> > is the same UDP returns when sending a single datagram that exceeds
> > MTU, after all.
> >
