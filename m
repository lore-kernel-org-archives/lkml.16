Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E9C41C63
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 20:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744922702; cv=none; b=LgBxOHzXemjSlK2wQcO8EfYq/sPUd66mlVaQ9pqOcqMrmz5yOrT4GsQVOEdvkQKwl0th58S3gKWGdZWhTyJNmTD+KGwfPPWGWLT7CqqScS4PU7nsdm57965NOe1ghZsvFAyd+9G95YDNpiWBZImhATaYfBqqm5TNaDI+7i8dyno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744922702; c=relaxed/simple;
	bh=rQ8/tRiH2Kfjm/NwhQklMuZsLWJDIdxIZoYzLBKwQmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eONZ38cY3KWie3Xyus1NlTSkGdwcLpLsi19qRYNHj9jRv2l/6vDRCqGYHTB3yZ2e4VnUlPY13FHJxUtcKjcH2kqA3fh5+j4Wv3svmfh+ojpYFwhapgq0+3/+iGxCH+eO+n/AcKrptUr3yBqtqasunuuoRetR0Kv1sG0nGVvUJ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2GmWn79; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2GmWn79"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736a7e126c7so1154423b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744922700; x=1745527500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1WebkH56zb7G6DhIHiiBnNyOX71aQ4HiSgmHnZkjHA=;
        b=l2GmWn79O56umWZCPEVmb3wf6BzyHjfjPceChhoGHssQthEhzGEYmoqWLgtpOXKhrE
         sDwKjSPQNs/8Yo4DR5i31lWN++61+g9gUDV4wpE10NjRwNMXCCX73diYg1Zk1O0JV7Dj
         ArGldgt2N1xIPOPV4lG1E/QyVoM4S+bvEKhPu+K4+rtL/dzG1vMYS6AHPyYvoiXyZLt0
         mSuzVCDduhoghplHQupUpwiKCa9RnC5t6wCubfAkO5VTwau2MLBKvAg02D7EoaBmzcU4
         J2+yiOguIzDexcX7E4nB5ACyRuxrU5FU92VTuZIYWj4hgLBsyF9TpWQH8t61vAVsNELi
         kfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744922700; x=1745527500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1WebkH56zb7G6DhIHiiBnNyOX71aQ4HiSgmHnZkjHA=;
        b=uHNY60YM3H9VP45SCaSQajzxnqfFUOxRMo2wHs9FpiqWxQdbd4jJjDyHvSW+abg47X
         NjJKT7iF5O1iC57TWM2jLz1+gcU1JWwGtbMWcT/3XRW1CGw7LQ/PN3eBzLtmEyHuTFDn
         QXa2sjSz1SVxcZsed7bhB1F2ggK1DAK3Hbt2ll8ls449BnTqVjYQUOfaw0zAYgdd/cgC
         OLLWb7NkVzAzmNgMPtcJzQbEphZ+QyxXrH5FDW8E94YZk8Wk55pUbrCvc9JZXwIp9eEx
         K/VccHHPJbpJ/g31++Znn5er9jUQEawWEiV+bg6Vgq0bRnOy+tgAFV6PYv9ICJp9C0Cv
         WnAA==
X-Forwarded-Encrypted: i=1; AJvYcCXRKh2ENRlV99FsjIk9nLYhr7yaLftZfjj77bRSqw1T1ArbFIKSnf+zDRcM205dXeWjSZFznjHX8OFVpR0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzla2pl+61n/CeDxyhJuR929XZdtHv2JJRD5nmIxyPx+n6WUth7
	Abwrk9icaJEt1Uz+BoBFwrU2By5bHWBlfLIkKkfRn4DooeIQCrrYCctfhIJOO6oddPTHFWFbcJ0
	8Vb105UFMseivv6t22bwYmv0T+Yk=
X-Gm-Gg: ASbGncvfzjG9OCOuNdPdqixneRYeiSmFfn4qH6CeeNBEKOA4lvLtOe/3OCu/iGcFmT9
	qP+dPYXImlZRNO+B9IYI2E58AqpTgX0s5vpGgfZ6VEWhY+lwOPW96iFeLPKhW5tLUPCjFsMWRkv
	Fmp3X9CATgKt/6k+dpIdSPejqJmfmi4ue3lelF2A==
X-Google-Smtp-Source: AGHT+IH6P+rw0rH+i/tJDRg48raNeT0ozLCzudndX44Z5cDiOIUS9XvrR4olo4WXstj23esSjt2Szx8eednW22u0uDM=
X-Received: by 2002:a05:6a00:928e:b0:736:51ab:7aed with SMTP id
 d2e1a72fcca58-73dc1582877mr324322b3a.16.1744922700380; Thu, 17 Apr 2025
 13:45:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417152808.722409-1-mykyta.yatsenko5@gmail.com>
In-Reply-To: <20250417152808.722409-1-mykyta.yatsenko5@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 17 Apr 2025 13:44:48 -0700
X-Gm-Features: ATxdqUF0nWldrdhHiQzfKQVvVttGVxo_-gQ6-QjL6ahNuQWYtCX_lC8NolP6WVg
Message-ID: <CAEf4BzbVPQ=BjWztmEwBPRKHUwNfKBkS3kce-Rzka6zvbQeVpg@mail.gmail.com>
Subject: Re: [PATCH mm] maccess: fix strncpy_from_user_nofault empty string handling
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>, rostedt@goodmis.org
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, mhiramat@kernel.org, 
	andrii@kernel.org, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	Mykyta Yatsenko <yatsenko@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 8:28=E2=80=AFAM Mykyta Yatsenko
<mykyta.yatsenko5@gmail.com> wrote:
>
> From: Mykyta Yatsenko <yatsenko@meta.com>
>
> strncpy_from_user_nofault should return the length of the copied string
> including the trailing NUL, but if the argument unsafe_addr points to
> an empty string ({'\0'}), the return value is 0.
>
> This happens as strncpy_from_user copies terminal symbol into dst
> and returns 0 (as expected), but strncpy_from_user_nofault does not
> modify ret as it is not equal to count and not greater than 0, so 0 is
> returned, which contradicts the contract.
>
> Signed-off-by: Mykyta Yatsenko <yatsenko@meta.com>
> ---
>  kernel/trace/trace_events_filter.c | 10 ++++++++--
>  mm/maccess.c                       |  2 +-
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_even=
ts_filter.c
> index 0993dfc1c5c1..86b7e5a4e235 100644
> --- a/kernel/trace/trace_events_filter.c
> +++ b/kernel/trace/trace_events_filter.c
> @@ -800,6 +800,7 @@ static __always_inline char *test_string(char *str)
>  {
>         struct ustring_buffer *ubuf;
>         char *kstr;
> +       int cnt;
>
>         if (!ustring_per_cpu)
>                 return NULL;
> @@ -808,7 +809,9 @@ static __always_inline char *test_string(char *str)
>         kstr =3D ubuf->buffer;
>
>         /* For safety, do not trust the string pointer */
> -       if (!strncpy_from_kernel_nofault(kstr, str, USTRING_BUF_SIZE))
> +       cnt =3D strncpy_from_kernel_nofault(kstr, str, USTRING_BUF_SIZE);
> +       /* Return null if empty string or error */
> +       if (cnt <=3D 1)
>                 return NULL;

I wouldn't touch this part and leave it up to Steven to fix (if he
agrees it needs fixing). Current logic seems wrong already, as it
won't correctly handle -EFAULT. And, on the other hand, there is
nothing wrong or special about empty string, so I don't think it needs
special handling. Let's drop these changes in trace_events_filter.c?

>         return kstr;
>  }
> @@ -818,6 +821,7 @@ static __always_inline char *test_ustring(char *str)
>         struct ustring_buffer *ubuf;
>         char __user *ustr;
>         char *kstr;
> +       int cnt;
>
>         if (!ustring_per_cpu)
>                 return NULL;
> @@ -827,7 +831,9 @@ static __always_inline char *test_ustring(char *str)
>
>         /* user space address? */
>         ustr =3D (char __user *)str;
> -       if (!strncpy_from_user_nofault(kstr, ustr, USTRING_BUF_SIZE))
> +       cnt =3D strncpy_from_user_nofault(kstr, ustr, USTRING_BUF_SIZE);
> +       /* Return null if empty string or error */
> +       if (cnt <=3D 1)
>                 return NULL;

ditto

>
>         return kstr;
> diff --git a/mm/maccess.c b/mm/maccess.c
> index 8f0906180a94..831b4dd7296c 100644
> --- a/mm/maccess.c
> +++ b/mm/maccess.c
> @@ -196,7 +196,7 @@ long strncpy_from_user_nofault(char *dst, const void =
__user *unsafe_addr,
>         if (ret >=3D count) {
>                 ret =3D count;
>                 dst[ret - 1] =3D '\0';
> -       } else if (ret > 0) {
> +       } else if (ret >=3D 0) {
>                 ret++;
>         }
>

This part looks good and does indeed fix the issue. Good catch!

Reviewed-by: Andrii Nakryiko <andrii@kernel.org>

> --
> 2.49.0
>
