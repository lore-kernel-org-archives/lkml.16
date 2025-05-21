Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C051EB39
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747804943; cv=none; b=i470fzlI8fE5LzwfxeJI4mQDuyaSWAewhTRN5WWsCedJVf4zB5T3B8niACU0xESaafilly6N4f3wIxuS8shVU8qwyn0qjqSZmaaLbR1ZzLnIxXOMSJSMCiRthF3ydBsHv9CCE3dPU8AZ5xS8q/t5sRxV6NUrcL3r/4sB5B+ygaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747804943; c=relaxed/simple;
	bh=tixqIQcduKf2tAEZ7tPACW3X71xMssHd0YmmZItpnFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=om2HgAupoDW9fe7TdAejqu8YKf3dlDVRxQAINnnVoOKpemeYLKNtvbni16VZRZXmjQkI5gglUDfRfSUC59KWnhlNwewPUl+JJomoc8hBMESoaJ/4WnWpu7VZhiygbDejOVbMfhTMzGulLpYGSwl7E/taRKgPC+GJqTa5elHdnEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eldYYpGH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eldYYpGH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d5f10e1aaso219225e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747804940; x=1748409740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yf7GkfJ8YuQ9gAhJcAbhAa/hdNoAzv1ECbunM6p8VSw=;
        b=eldYYpGHQVD6GD6oJWgCIHk7/wcEaxeOFBMpDIERXFB81K6rxV4RFmqKg4wBQdGFAD
         xRTpE5YJTcgE5OhEoBbw7G2dlwH4jHhk/WZFs67GgThObwtaaPzUI7S24GmXZQjidjuf
         AppkFx0vA2VfgTHdc4wW9xkHi/heyMj5m8zROEXNYLbFH5HqZdeHj7VFOG6kcEBMPONo
         KIz2zDgt8wga4MO9RXE+73QayJlFBhqqBZnLiNjENV9BEzg7wpXyGnLVA1ZAdVI0on18
         yHSvTJsdkrWgULjsvLVXJhraVBgzJFooo9ZM/NVnpWROohR3nBUJDo/+dJ9SmZDqTthD
         E/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747804940; x=1748409740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yf7GkfJ8YuQ9gAhJcAbhAa/hdNoAzv1ECbunM6p8VSw=;
        b=YuW6qdj7a4VZLTV1XLLXyiBvJKlc/8pJzJcKlY1gTo584z38OttL0eYgRvtDMOx2Jt
         WlevMDtplkIL6dyb7KqCCZVUO5GNcQHJtlDhaOoXweygHFtCtt5v/Jnnz7T+FVXaJFj1
         QlhiJFnF5K8mAn/f5FoMN6fuhH+DFKf+xVrcpfy8c2m64AMTVUX2pdzSKnT73ZEIBx3m
         DI4gsX0Bmzoxd+cCctCn8lbqj7DnyuEw8hI8Igu1gEODVWQoctyTCbBGqwZ3fsn3Ti2h
         e/cJsaqOlGk2rFLypK4O+B5U+p99HfXuzlkpv20g8ey/45v/8qdGcrxJtYlJpQXyY/uU
         IglA==
X-Forwarded-Encrypted: i=1; AJvYcCUX3By1CrVZfkGHYydGJXc2CCfp4+UxvoGqrZoBgdrLJHomawbGshDKt2oYa2JPMitFhFX+tEjsCKjxE0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdKAPhqns2Bjlrcswy8mlSOlg4f/LcKEGXmDmpO+TUXY6VWDbH
	d0OXqLxjKyUTXOeX9aYt9/MKLTW7WVc6sclIiNdPDHyDmrd9kNhR12ug8At8KemMA2ibu7TjwDe
	2QxnsxssWYM9KZ9A1KRmkyiSNayeZPH1wMPNrRtpc
X-Gm-Gg: ASbGncvA6bd2pRS+V65zvDLtr8DChfnkBgOie4/hWwa0nvP+2yn76GXeMNVWCcIWyKW
	CRNuXUZpuN3E0+t3X4s95cpsfztyLPaIqCim3L+WWsmQrpc90/y+6ki3s1M4if0Kpy6s4gfI644
	q3UHSOXo/Ti8nIUTc6PgxvlB2XjO5suOmCkM6Y/ktpFHLHMUFHBxThoR+bY5sl+Y0CkrNoi/eo7
	Tne
X-Google-Smtp-Source: AGHT+IF5YfPNxW00EQZIxWo+YrQrc4LInR1njdfkcWfFBPEgE0/GWO0Jybf072hOz9bQgr30dT30Pl4vKA7ZCdnC1hY=
X-Received: by 2002:a05:600c:1f82:b0:442:f4a3:8c84 with SMTP id
 5b1f17b1804b1-443eef3cbcfmr7380695e9.2.1747804939586; Tue, 20 May 2025
 22:22:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517001110.183077-1-hramamurthy@google.com>
 <20250517001110.183077-7-hramamurthy@google.com> <50be88c9-2cb3-421d-a2bf-4ed9c7d58c58@linux.dev>
 <CAG-FcCO7H=1Xj5B830RA-=+W8umUqq=WdOjwNqzeKvJLeMgywA@mail.gmail.com> <abf16cc2-c350-430d-a2fd-2a8bedef9f34@linux.dev>
In-Reply-To: <abf16cc2-c350-430d-a2fd-2a8bedef9f34@linux.dev>
From: Ziwei Xiao <ziweixiao@google.com>
Date: Tue, 20 May 2025 22:22:07 -0700
X-Gm-Features: AX0GCFtE2E5widA50MV8ndFWAuPVhKzT4evlMPgA6Ylurjfd7oa_lZTeop0nrqw
Message-ID: <CAG-FcCOPyAo6r3difj2pzUNE7DinTwespqPxw3k6bqjEPdNaoA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 6/8] gve: Add rx hardware timestamp expansion
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, jeroendb@google.com, 
	andrew+netdev@lunn.ch, willemb@google.com, pkaligineedi@google.com, 
	yyd@google.com, joshwash@google.com, shailend@google.com, linux@treblig.org, 
	thostet@google.com, jfraker@google.com, richardcochran@gmail.com, 
	jdamato@fastly.com, horms@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 12:53=E2=80=AFPM Vadim Fedorenko
<vadim.fedorenko@linux.dev> wrote:
>
> On 19.05.2025 19:45, Ziwei Xiao wrote:
> > .
> >
> >
> > On Sun, May 18, 2025 at 2:45=E2=80=AFPM Vadim Fedorenko
> > <vadim.fedorenko@linux.dev> wrote:
> >>
> >> On 17.05.2025 01:11, Harshitha Ramamurthy wrote:
> >>> From: John Fraker <jfraker@google.com>
> >>>
> >>> Allow the rx path to recover the high 32 bits of the full 64 bit rx
> >>> timestamp.
> >>>
> >>> Use the low 32 bits of the last synced nic time and the 32 bits of th=
e
> >>> timestamp provided in the rx descriptor to generate a difference, whi=
ch
> >>> is then applied to the last synced nic time to reconstruct the comple=
te
> >>> 64-bit timestamp.
> >>>
> >>> This scheme remains accurate as long as no more than ~2 seconds have
> >>> passed between the last read of the nic clock and the timestamping
> >>> application of the received packet.
> >>>
> >>> Signed-off-by: John Fraker <jfraker@google.com>
> >>> Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
> >>> Reviewed-by: Willem de Bruijn <willemb@google.com>
> >>> Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
> >>> ---
> >>>    Changes in v2:
> >>>    - Add the missing READ_ONCE (Joe Damato)
> >>> ---
> >>>    drivers/net/ethernet/google/gve/gve_rx_dqo.c | 23 ++++++++++++++++=
++++
> >>>    1 file changed, 23 insertions(+)
> >>>
> >>> diff --git a/drivers/net/ethernet/google/gve/gve_rx_dqo.c b/drivers/n=
et/ethernet/google/gve/gve_rx_dqo.c
> >>> index dcb0545baa50..c03c3741e0d4 100644
> >>> --- a/drivers/net/ethernet/google/gve/gve_rx_dqo.c
> >>> +++ b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
> >>> @@ -437,6 +437,29 @@ static void gve_rx_skb_hash(struct sk_buff *skb,
> >>>        skb_set_hash(skb, le32_to_cpu(compl_desc->hash), hash_type);
> >>>    }
> >>>
> >>> +/* Expand the hardware timestamp to the full 64 bits of width, and a=
dd it to the
> >>> + * skb.
> >>> + *
> >>> + * This algorithm works by using the passed hardware timestamp to ge=
nerate a
> >>> + * diff relative to the last read of the nic clock. This diff can be=
 positive or
> >>> + * negative, as it is possible that we have read the clock more rece=
ntly than
> >>> + * the hardware has received this packet. To detect this, we use the=
 high bit of
> >>> + * the diff, and assume that the read is more recent if the high bit=
 is set. In
> >>> + * this case we invert the process.
> >>> + *
> >>> + * Note that this means if the time delta between packet reception a=
nd the last
> >>> + * clock read is greater than ~2 seconds, this will provide invalid =
results.
> >>> + */
> >>> +static void __maybe_unused gve_rx_skb_hwtstamp(struct gve_rx_ring *r=
x, u32 hwts)
> >>> +{
> >>> +     s64 last_read =3D READ_ONCE(rx->gve->last_sync_nic_counter);
> >>
> >> I believe last_read should be u64 as last_sync_nic_counter is u64 and
> >> ns_to_ktime expects u64.
> >>
> > Thanks for the suggestion. The reason to choose s64 for `last_read`
> > here is to use signed addition explicitly with `last_read +
> > (s32)diff`. This allows diff (which can be positive or negative,
> > depending on whether hwts is ahead of or behind low(last_read)) to
> > directly adjust last_read without a conditional branch, which makes
> > the intent clear IMO. The s64 nanosecond value is not at risk of
> > overflow, and the positive s64 result is then safely converted to u64
> > for ns_to_ktime.
> >
> > I'm happy to change last_read to u64 if that's preferred for type
> > consistency, or I can add a comment to clarify the rationale for the
> > current s64 approach. Please let me know what you think. Thanks!
>
> I didn't get where is the conditional branch expected? AFAIU, you can do
> direct addition u64 + s32 without any branches. The assembly is also pret=
ty
> clean in this case (used simplified piece of code):
>
>          movl    -12(%rbp), %eax
>          movslq  %eax, %rdx
>          movq    -8(%rbp), %rax
>          addq    %rax, %rdx
>
>
Thanks for the analysis. I will update it and send in the v3 series.
> >
> >>> +     struct sk_buff *skb =3D rx->ctx.skb_head;
> >>> +     u32 low =3D (u32)last_read;
> >>> +     s32 diff =3D hwts - low;
> >>> +
> >>> +     skb_hwtstamps(skb)->hwtstamp =3D ns_to_ktime(last_read + diff);
> >>> +}
> >>> +
> >>>    static void gve_rx_free_skb(struct napi_struct *napi, struct gve_r=
x_ring *rx)
> >>>    {
> >>>        if (!rx->ctx.skb_head)
> >>
>
