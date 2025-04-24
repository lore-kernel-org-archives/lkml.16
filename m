Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86691F8BA6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745536049; cv=none; b=m54WwzDM0qNXKp0TrM1+2glvjxKc2c5D1YMJ/ZudwFR7qKgv986Wq3h4oriwDsDPclujlpb7jYfVBe90AKb4HWt8eKnz+6Zhfi/JgXkqQPReg7DchRTEa8woVx5oRWL3rEvzy/rFVTaAwJjf7dncaBSOXvATsd3xnorDpNVjI4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745536049; c=relaxed/simple;
	bh=QNiHWZ7qBguVy4s8n+62BvHVCzA4eTMredPNza24+Fo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pw4NfmkGsyp3FcByEtiR9SwCapkzljaSa4MixIUh9aXd/eHvzoE1wogjh82l3EuI/VDjKq/ZhmB2Cp53vEasdg8Sdi3JY+kI+/thhdh9lHNQ1IAF6n0wPUH6NcX7FJxiwk/OygSvsieRYERPd7p0aidcmrhh3ONKvQr/oxGTrD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O2zdA4o0; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O2zdA4o0"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4766cb762b6so18459131cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745536046; x=1746140846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sY9PcGrMcPiR93EzC54QuJTM2y/dFMLC4+Ts0wH+Kk=;
        b=O2zdA4o0GqgV0yZxu88iL4I40xX2ccNCIhD4P6g9kG3jZV9MYo9ROjRDgdkr78jwUA
         s9A237cBo06rZQpmXnNteime7pvYv14YCx3XhVvBWjcD+YtLJkl23HUfvHNx3gRs2nug
         Bi3mmzXdymLFz1Hy0NM8w9mNwWB2sQNeFA8pZg7WaIblqWGnki3u+5w1Y6+jlfkjK7Yl
         /e5cUux1+DXZYgSgQ1MvMdLy+VZHNT46KoT1LkAd2aUmki28aEcUkI9qewD85G2Nl5Gi
         OerXiihvQaz+2D0AlmDZb1iujz2I9JEH3p3RJvcT4PXz+hTJ6MYPiIRuM5rqxEhGvzCR
         WXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745536046; x=1746140846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sY9PcGrMcPiR93EzC54QuJTM2y/dFMLC4+Ts0wH+Kk=;
        b=gdW7imwpFFHlBds2dtMJ0GLucNVbNB/E2d15jS+RfhJW9xjl8DUpjazpwLNMtXY/Dm
         oxub/rsAisEdAQZK3Oz4CJp0fFO8zhbXIl42TRy0GM5T6U7x+WlaslQaNJHLTs8oJr9G
         fFhMbbq64ar0Gf1Wzc/enYNzpSNgDATwcOlrOIKag8luYnqmBeFaMAoqA+lVu+/iKc74
         miJxtRFe3qpGKkSnINfPrbKmWDMdo5VP1aIOMALZUdnkJdMBpR/uQihghsKxJmiahUWk
         1/U5bdeEB3/SNb6NOaFRC+6e2548JiyOz7k8kZdYY6RIJYzm5F20Uo0iQ+Ij1L/KBfEV
         wURg==
X-Forwarded-Encrypted: i=1; AJvYcCX7vQ3AN7ZgsL9C5jgHrFX7SkGO5JBNFZ43wl3pp8HunnCFnEyel4MjEIlA53JYMk2mZ1HbU2m0LGNo3z8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqQI172WvY67Ore0z+RRY1YttczbA7t26NmB8Plhxu+hL2mMOY
	xD/hiPfpOCND5cZJm1hFt8n3p4I26DVgm3S5b1lfWvmkJz5a05B1IrSAiM/H1K3T/BkE1iaIBBC
	rxPzyraMdiM3Ra3hmC8inZaKvF2RNg1BAyaRJ
X-Gm-Gg: ASbGncuszyRpWGgwPZ0gcrRs2/uW8UoW+iGDYL8nXyS2XxnOKyqDSwRqO8bv/6C+wPh
	WT0BYdt2LX/BWlk6U9ZfiKZ4V3SwqgBsCT81EBIaAY8CagF91xDLpFUycunMeueGIdwUpHNZ8z2
	tOFtc9nhTVe+FrewnDP8b9rZScEgVFWmLeRMWY+c5+NrZc5kLXpQ8=
X-Google-Smtp-Source: AGHT+IHN8EnBHya10mMVBn9FOeITQVpdIezkflqNJZpBYOMFJYkRn1iwNCF5+tGu6ieRDiTcg2yFkhFm2/dK+WIhoo4=
X-Received: by 2002:a05:622a:1490:b0:476:fd6e:df89 with SMTP id
 d75a77b69052e-4802f401555mr817831cf.17.1745536046449; Thu, 24 Apr 2025
 16:07:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418-reftrack-dbgfs-v4-0-5ca5c7899544@kernel.org>
 <20250418-reftrack-dbgfs-v4-7-5ca5c7899544@kernel.org> <20250423165323.270642e3@kernel.org>
 <a07cd1c64b16b074d8e1ec2e8c06d31f4f27d5e5.camel@kernel.org>
 <20250423173231.5c61af5b@kernel.org> <cdfc5c6f260ee1f81b8bb0402488bb97dd4351bb.camel@kernel.org>
 <4118dbd6-2b4b-42c3-9d1e-2b533fc92a66@lunn.ch> <20250424155238.7d0d2a29@kernel.org>
In-Reply-To: <20250424155238.7d0d2a29@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 24 Apr 2025 16:07:15 -0700
X-Gm-Features: ATxdqUF1y81lAMD7mTkP2HpcEnhJ1AnwgKYKeN-Rcvh0ryWWWr7u-uFeynOUxZU
Message-ID: <CANn89iJn53KF8CG4Q8D97sFy0hhkLrgWbFwHfJb8-w2DudZdZw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] net: register debugfs file for net_device refcnt tracker
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Jeff Layton <jlayton@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 3:52=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:

> But with all that said, I guess you still want the "meaningful" ID for
> the netns, and that one is in fact stable :S

We could add a stable id for net devices, and use it for this purpose

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 0321fd952f70887735ac789d72f72948a3879832..339d09167eaf7f58fc877fa470c=
94175237ce534
100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -2544,6 +2544,8 @@ struct net_device {

        struct hwtstamp_provider __rcu  *hwprov;

+       u64                     permanent_id;
+
        u8                      priv[] ____cacheline_aligned
                                       __counted_by(priv_len);
 } ____cacheline_aligned;
diff --git a/net/core/dev.c b/net/core/dev.c
index d1a8cad0c99c47996e8bda44bf220266a5e51102..9d2d45e0246fab99ad3e7523885=
224bd114fa686
100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -10954,6 +10954,9 @@ int register_netdevice(struct net_device *dev)
 {
        int ret;
        struct net *net =3D dev_net(dev);
+       static atomic64_t permanent_id;
+
+       dev->permanent_id =3D atomic64_inc_return(&permanent_id);

        BUILD_BUG_ON(sizeof(netdev_features_t) * BITS_PER_BYTE <
                     NETDEV_FEATURE_COUNT);
