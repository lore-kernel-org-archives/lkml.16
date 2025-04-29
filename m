Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA66F2C2ACB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745929403; cv=none; b=KXpVXM+FcTqjfhLj3+Bpn9OcW8UO7FBttUV3eqWYePF1sG42/Pa+P8Le0GFZUxkhJXXJRhwqw6VqtXsUoeUUktMxW5oGn2mujU2HbE0rsDUBsv9DVZLQqFF9vP8Yg2LAGkdi09WkRCL88se/6QwsM9Zan498D9rtoPIhWEK4aKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745929403; c=relaxed/simple;
	bh=7v/NtnGJDDFCEyldSLt29lHQLBKJmPLaCLCeDapvvOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppt7MNAN9bStII0ZWk0s/2hepevHaawG1UM+U1N3+fO7bJ71mmWN/S1tPzgRINvew19jS2dlb3FZOrat/GE70EShKbOxMMLMcfijBzTgAmCTdN8VBWsbdnjgn3JhWP09VtY0a++WrQmPvakbSpGBgXlUDzFAhoqRsFVh/Eev9eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ExM5Zay8; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ExM5Zay8"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so11039245a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745929399; x=1746534199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ws6hEpI3Ifd8q1mvUtviJQ/4xSzZh4pZUWX7PI8ifNc=;
        b=ExM5Zay8ZdNUVE36z9HZS3EX73IkytgeLFWb3kMaN7JvbCvh2u35dqTcuhgBbVmRv4
         4PMJeQZWJjamcg+DMARszRio/4DTy2F3PSRhrU3/ZfCTZ4uOVghg+rxKxC1UnJDM+GAW
         t7WR+vlyzWiqY02QKpm8iOEp7sEAIEtuTehB8msimXUXeiTDE06Yu4Iv/Wa0fTFLejo0
         6hlkVx/Q+flksgXqBs70YXW7oEyYSmR/bj4WsqgnQFnINE4X2sL1RHJhL0iH9XnpHnhF
         CCbEG5gY1FrBXoO+brHCZ/97QIrol35bR5dOK6Irl22qizk8MrJpGMqJtistM5k9yp77
         2nVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929399; x=1746534199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ws6hEpI3Ifd8q1mvUtviJQ/4xSzZh4pZUWX7PI8ifNc=;
        b=xGosqfxHoA/xbbKWEFKMpjA+Kbr8iJvOOJx26xaAvfiQU8nd7U2ch8m+sckILiSmba
         ek+f2OpA8sGT6mzO4Zf/xqHQ/uPEkgGzrvkJxOgSDVXMVrXBzXx7hSLj2QSi99ZpZeq9
         Jqx4kRsELO7zCHubD/LbCBMxJT0DtmXxObX91YH2kf+rO+5t3VGYTGVGKMRmJ4Pr/QeX
         1Rev6PM9+yJdEXdg/nWs+Ud9vZ2PUXoocuFG1aiaP7Wc1Y0YQqxnXyj+U+znC4Cr+UjM
         bhahPVmmnuO/eHquE/mdB8suIguz81JYdgZ7bM3TPi1qIpYSqufqopM3Trn6aUWIApbf
         G4dQ==
X-Gm-Message-State: AOJu0Yy8WED248fu1bpavl955MdfgmQMxui+HT2PNhiJwALUVe5tnvMX
	f2pLZGJErE2Rfm9WjZ3gzr2EkpdcZwCMw+oMvi0NfJH4Ulvi7ygkfsDUjgGzxlw=
X-Gm-Gg: ASbGncvthSuFA1QkkZ6aWxV9QKqO4e7xIUOZIe/URo2OwJzaX8h+jhM/oD9uxeT3kuS
	QuCxxKuh5CT1UcHtE9d+bjL2uv8SImiLAsloYsxeIA1MpfXCemZ5zpZtoAG37fvURq/ftoGs/v4
	BZ8HlTQgJ72yXlZrDIxF3cP0sT8pmjVC261bUQdM3UdiYloodrvXrTliQYZExFTilsVUYd1Fise
	eZx1DmakUHjBjTAdBmQcknR4+8Kb3khepNtl8GJ1j9k0c/zXCDumreNqwgEOJxWFQLHlpzcv0OB
	NfCt28FPdGqLLiB+NT7p4b57vz6/ZCkZw4r4xtU/
X-Google-Smtp-Source: AGHT+IFwxK9V3BKRlXetULpaWC/TTi2qw/MHGNZEIFzXoz4Cb1vQZPeYkUQVj+xRegsDDtI6cGJYqA==
X-Received: by 2002:a05:6402:2713:b0:5f4:c2d0:fb9a with SMTP id 4fb4d7f45d1cf-5f73960e52bmr11289227a12.19.1745929399155;
        Tue, 29 Apr 2025 05:23:19 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f6545sm7317860a12.39.2025.04.29.05.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:23:18 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:23:17 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: Re: [PATCH v3 15/20] ratelimit: Warn if ->interval or ->burst are
 negative
Message-ID: <aBDEtcmUEhiL5-zO@pathway.suse.cz>
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
 <20250425002826.3431914-15-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425002826.3431914-15-paulmck@kernel.org>

On Thu 2025-04-24 17:28:21, Paul E. McKenney wrote:
> From: Petr Mladek <pmladek@suse.com>
> 
> Currently, ___ratelimit() treats a negative ->interval or ->burst as
> if it was zero, but this is an accident of the current implementation.
> Therefore, splat in this case, which might have the benefit of detecting
> use of uninitialized ratelimit_state structures on the one hand or easing
> addition of new features on the other.
> 
> Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
> Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
> Cc: Mateusz Guzik <mjguzik@gmail.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: John Ogness <john.ogness@linutronix.de>
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  lib/ratelimit.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> index 4f5d8fb6919f7..63efb1191d71a 100644
> --- a/lib/ratelimit.c
> +++ b/lib/ratelimit.c
> @@ -40,6 +40,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
>  	 * says always limit.
>  	 */
>  	if (interval <= 0 || burst <= 0) {
> +		WARN_ONCE(interval < 0 || burst < 0, "Negative interval (%d) or burst (%d): Uninitialized ratelimit_state structure?\n", interval, burst);

Just for record, I agree with having this patch in this form
in this series.

That said, I think that we should warn even about using zero
initialized structure in the long term because of a possible use of
to-be-initialized spin lock. But it would require fixing
existing users and it is beyond scope of this patchset.
It is related to the discussion at
https://lore.kernel.org/r/aA-f0jpBBbdfsmn7@pathway.suse.cz .

Best Regards,
Petr
