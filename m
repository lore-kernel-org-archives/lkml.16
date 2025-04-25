Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2982621B910
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610930; cv=none; b=pm5w7YTKvOIuy0FOvhJVou8A/nKi3aEJVT/jQkp33gTUvbBmhsqR0XETv1fKRd/WQndt7ZhZeopyq29qE+OYeP87AdKKAgvkv4o29tNJjymm/oGl+kW6yOXInB+hWxBEQBYmRVVI2CCdwtu4uItc/8zIbwikOoqDxFWavb+reSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610930; c=relaxed/simple;
	bh=YkYI2UerAJ9rFXqXK9R7az+VrbS7ruw5DYqt9hl2Nyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQXpaI3HKml61XvPe8/nkP6bbZ4CZvGLYCrMkl/8HQssenlpr6seVQJRd/x7TWP7LoK/xGNBSCKH9+1E0WCMjrE0rHdLGDus3pfeKdUWNwW004XhxvlMhSxw+GqvvToAcrM7hTjwSxxVONnRTrBArtb4IESG/bRIg+A+kE3S9GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHLw/zz1; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHLw/zz1"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e5372a2fbddso2402934276.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745610927; x=1746215727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrXciBeDVNhReMYqMBDNjD45OpghW+ifP5F4S57KbJA=;
        b=cHLw/zz1tQy8AvHgIyYTJWOsujWWq7uXojK7ybgiZ2/djOmow6ktHC4ZPfjXmX9ZkC
         IGePT+cA75K/mCKRQcpWLokj+ghiWT8bQ5kIHe9xx+pWWrOuiG/bgNz3+uRseHYYrXod
         u/ScO7gSKkqO+cm1EepGxfODkqV09UCulX9I3DdTbNS3nRwl+mKxNMXRW43hp5R5p3lb
         4oLJXgoVogijAShWQHLONo3SvlkT1cSHYC1+BKcdegiLBOPO/qlz6qxD56O+pp5AhzVJ
         FXL0xLuQxfVQV79zsVrhmD2QJQpKvZr37hu4vN6ptezfUOM16GftKvotiy2z1Df1ybWp
         TlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610927; x=1746215727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UrXciBeDVNhReMYqMBDNjD45OpghW+ifP5F4S57KbJA=;
        b=Wr5ZpWK1aWhF3OMrRPEmGnOZRqV7B4WkB9Tqhxn7MQv+vecy9ygIOcJdtyZ11nY+bn
         eXnzJwd/Maqj2svHRWebQkslfKUfblnm/p5Glj2OobAFJd7tZZEunjWQM6SEDBT5WX/j
         0TOpFs+SGFcCtmd6isFf0IcPQuW14U8U0yW4f0UH834ykOs2vn/I+vwa82uMW4RH/Hqx
         JnjELHCSqMLt4+WT3+C0OSEJBfacXwoOhOByqHBHn2r9ZJq4W1GvZaoD0R22dNaYuoLH
         oU19GbW51Tq3atE/Q94Qgi1nfNV9wW366ImOCR6JScc7c5ZmOoWMp388yOat9yHuM98e
         t3yA==
X-Forwarded-Encrypted: i=1; AJvYcCXAHo050gtX6qudhuEwbR56Ll/9fNjbe3evz8hbCLe9hfuMxawoIiZf8NXiRbxTk+AC1idMCnphY1C12Dg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6KphG+a7Ace0oZ7yaT9r2UB3719asZxwzMn49JbdS+JdPpJ9h
	v20OPli9TU6Hc1n2W55Htx7lssd97gRPan3yL5rGaLgCUtTJWKQN7AB2LlL4gY0RVeyPPOg88oR
	W4fi3UjChlAve3ZrSNwx34JOOBW8=
X-Gm-Gg: ASbGncuRc+Jso3iPBjkPBW5RCFlf3psAfqPf4ysTqg0IWkYzmEj5Z8GlYLh3hWwHQ6L
	Nf1+fcBjlMtEw+MMuVq4kYDjuUPC6xdUsMv9Ouznpk4vI385CummUSTOA/oliKvCCSAndxobLm1
	9gSS02t1TM87pwjEiylM+4BzFrKRsgIsGM6kPEQ54CenvRBr7qtIT5/g==
X-Google-Smtp-Source: AGHT+IHNcF93ygVUYkEcl83GWVs9xFZbaBu5te9iW6WLRa0MYyvtqFpnHtbyBCDfa6wYRJqN/zvwLPhjchwjSfuI2lk=
X-Received: by 2002:a05:6902:461a:b0:e6d:fb0f:fcbf with SMTP id
 3f1490d57ef6-e732344d533mr1397107276.39.1745610926871; Fri, 25 Apr 2025
 12:55:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250415182307epcas5p4853044d013dbc943a8e54dca0f2a39c2@epcas5p4.samsung.com>
 <20250415181419.16305-1-nj.shetty@samsung.com> <20250416165512.990257538f61be5857e513ab@linux-foundation.org>
In-Reply-To: <20250416165512.990257538f61be5857e513ab@linux-foundation.org>
From: Nitesh Shetty <nitheshshetty@gmail.com>
Date: Sat, 26 Apr 2025 01:25:14 +0530
X-Gm-Features: ATxdqUFOkipdMkS2-gVFcM-_1VGrDaphqj0-qJRV5szUIJ6G5imOlaR5M-dDf2w
Message-ID: <CAOSviJ1d3=NzwGb6kKfD5zucdbrOQfyO0my_b0wr-NXuQzFGKg@mail.gmail.com>
Subject: Re: [PATCH] iov_iter: Use iov_offset for length calculation in iov_iter_aligned_bvec
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nitesh Shetty <nj.shetty@samsung.com>, Alexander Viro <viro@zeniv.linux.org.uk>, axboe@kernel.dk, 
	gost.dev@samsung.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 5:25=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Tue, 15 Apr 2025 23:44:19 +0530 Nitesh Shetty <nj.shetty@samsung.com> =
wrote:
>
> > If iov_offset is non-zero, then we need to consider iov_offset in lengt=
h
> > calculation, otherwise we might pass smaller IOs such as 512 bytes
> > with 256 bytes offset.
> >
>
> Please describe the userspace-visible effects of this flaw, if any?
>
a.
At present we see different behaviour based on whether the device is
512 byte LBA formatted or 4K byte LBA formatted.

Here is the scenario, where this case is possible, when using io-uring
fixed buffer IO with 512 LBA device we can get,
i->count =3D 512, i->iov_offset =3D 3584, bvec->bv_offset =3D 256,
bvec->bv_len =3D 3840, len_mask =3D 511

In this effectively, the first 256 bytes are in the current page,
next 256 bytes are in the second page.
This should fail the IO, but here we pass.
(For a similar setting with i->count=3D4096, this check fails).

To reproduce the test from user space, we can use a liburing application [1=
]
with patch[2], on a 512 LBA format block device.

b.
I went through file history and looks like this is a regression,
previously the fix was present, but commit
2263639f96f24a121ec9f037981b81daf5a8d60a introduced this issue it seems.

Thanks,
Nitesh Shetty

[1] https://github.com/axboe/liburing/blob/master/test/fixed-seg.c
[2]
diff --git a/test/fixed-seg.c b/test/fixed-seg.c
index 4154abb..e7c461a 100644
--- a/test/fixed-seg.c
+++ b/test/fixed-seg.c
@@ -64,7 +64,7 @@ static int test(struct io_uring *ring, int fd, int vec_of=
f)
                return T_EXIT_FAIL;
        }

-       ret =3D read_it(ring, fd, 4096, vec_off);
+       ret =3D read_it(ring, fd, 512, vec_off + 512*7);
        if (ret) {
                fprintf(stderr, "4096 0 failed\n");
                return T_EXIT_FAIL;
@@ -158,7 +158,7 @@ int main(int argc, char *argv[])
                goto err;
        }

-       ret =3D test(&ring, fd, 0);
+       ret =3D test(&ring, fd, 256);
        if (ret) {
                fprintf(stderr, "test 0 failed\n");
                goto err;
