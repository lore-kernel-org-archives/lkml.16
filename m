Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF95A2459F7
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 06:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749450860; cv=none; b=G+2qltuvRdLF+izHBnEpcsyg+m859CQlkMtBlhg3paolWD9Cm4TN/0x9WBd7GiMUwaHIsftFEzmZV6oCO9jyRTTLCY3cMYh9CWk9KpODMBkVXNqCDfiyGBlqtLrCqS82xou7VJydW3APGEax+RmLHcv3t3y68Fz6SnohrGfHFBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749450860; c=relaxed/simple;
	bh=V1MvQecxBbsavQOuQL/+VWXWI79oj6KeM3sdM+7ZXso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IC+16zs0xnfPw6sPgO1saL5JCKPDpVn7q0n73PoytiZmp3H2BTtPNcOCVs6QS8hRgPF0Xi8Tbacb1Pe7oqL9SyuZ8A61xRz1ewKnf7YTnN8hQglHRlCpQ/T3wCKNv7KWBo3qM7bJj/H6luLX+Z6tPxjikbQpD8l0uttwE69EgTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cGk+E0Qb; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cGk+E0Qb"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742c035f2afso2778263b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 23:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749450858; x=1750055658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3kw8UwXF8nhjHGY10czvDoV0t7L/vYXrP4PDYhL4cNY=;
        b=cGk+E0Qb0kslps4aLhesm1wmHl0j6yhJig/KaMmEeHfqRbRgTUEOsoyq9pWcOID/dG
         +O/Vum17Qt1t8YEK/kmF6gkDis5owyk5P45MnYWQewIx79pzUJjpNLAyG1gAEUgidQ5X
         RB3udox2uCM9wu3Rg4kS1G4J8xm0mV0pMcXPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749450858; x=1750055658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kw8UwXF8nhjHGY10czvDoV0t7L/vYXrP4PDYhL4cNY=;
        b=u0dcmG/scd9UGjFuZMtrG8jrbg0m90qrkppiMTWTANazjXprIHynodMwA52ZWSQuVD
         qT/i6/sXaCi/PQRqOZtajvIChFSZrP07Me5UurDOc5Je72VYgrgBQOIq3qBsLPHdYM7W
         V+qZlJvfksDu626Jzd7REHpGxqPSL90EjYSYLAp6UuHtKGpZycYNYKI4WPJQgE0dG67g
         TeyY9v20rh4G520mNIWOFOge5Yrqr+mLBDLOqPP7B6Z3XeYrDeqFRlp1mqiRN0pRYUSd
         tmmz4DKcdEs9aa8ES+8jythmQpy1qO0v5CyIvgaVk2hc8YcKM+bclpxokCWOgGijkN5M
         NeNg==
X-Forwarded-Encrypted: i=1; AJvYcCUzQZu9JZEVs/4ShgR2+aLTlGTCHeGn6v2RLB+U2XrYNNL1hWmjpk8WclbKV7JJaRzS37dEQfifqyrzvYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKSQ7UBeDwFJ6gg05LXmtdI45bGd6foKd38sldnx/Y5s1HGmHN
	UAXFLPXNXAvTUCTIb1Ih7ZObRgYEy1gt/NjJWTtqdgsi0Tr8lOXnHjWwEoY3dKx9IA==
X-Gm-Gg: ASbGncvv+34NbC3ZgMb+lmfqzcKAEziKt+N2rh36rVT7zq3+4GHbxgLAnsnp5/uSGki
	EM7FzlCxX2za47u7WtAia7Wej8ABW+CpJZT0eE9/o4raFfIRJxFaOpO17tHKER0zAjNA+wmmuCA
	Tb9CdcNH94Rcp2LKn6p842+hWVQqrEgg/GpTf/shJu8nZKr/hUhJE/zIlPPGTjfI6D+fdxq4khq
	Fq2RFQaq4OE9HrLN4Rcteg/eTRntNGoLCxQAnotuhR2OXokc0cMxcawzLPBDAnt9waT2fc1esUR
	Svza/kagEPhQ6AN/6UIfHSpJrIuPCkIsZTLIf8DOFY+LNDy9XajCfVc=
X-Google-Smtp-Source: AGHT+IGVMJMWeDkYNbKUWivodOVr3uS6WQKwvY28M+3/tgEEyS48Au7YaNU7yzcFV4tmbn8HKPfFAA==
X-Received: by 2002:a05:6a00:4612:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-74827fa2840mr14544040b3a.5.1749450858092;
        Sun, 08 Jun 2025 23:34:18 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:eb64:2cdb:5573:f6f1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0f28a2sm5185966b3a.174.2025.06.08.23.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 23:34:17 -0700 (PDT)
Date: Mon, 9 Jun 2025 15:34:12 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Tomasz Figa <tfiga@chromium.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] wait: add wait_event_freezable_killable_exclusive
Message-ID: <fyx2kxtef3fha4timgtwrcwyacarb6g6tz66qjiehoi7ierslw@hkbdq5aguxnz>
References: <20250609030759.3576335-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609030759.3576335-1-senozhatsky@chromium.org>

On (25/06/09 12:07), Sergey Senozhatsky wrote:
> Add a freezable variant of exclusive wait.  This can be useful
> in, for example, FUSE when system suspend occurs while FUSE is
> blocked on requests (which prevents system suspend.)
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  include/linux/wait.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/include/linux/wait.h b/include/linux/wait.h
> index 327894f022cf..b98cfd094543 100644
> --- a/include/linux/wait.h
> +++ b/include/linux/wait.h
> @@ -657,6 +657,20 @@ do {										\
>  	__ret;									\
>  })
>  
> +#define __wait_event_freezable_killable_exclusive(wq, condition)		\
> +	___wait_event(wq, condition, (TASK_KILLABLE|TASK_FREEZABLE), 1, 0,	\
> +		      schedule())
> +
> +#define wait_event_freezable_killable_exclusive(wq, condition)			\
> +({										\
> +	int __ret = 0;								\
> +	might_sleep();								\
> +	if (!(condition))							\
> +		__ret = __wait_event_freezable_killable_exclusive(wq,		\
> +								  condition);	\
> +	__ret;									\
> +})

Or I can do something like:

+#define __wait_event_state_exclusive(wq, condition, state)			\
+	___wait_event(wq, condition, state, 1, 0, schedule())
+
+#define wait_event_state_exclusive(wq, condition, state)			\
+({										\
+	int __ret = 0;								\
+	might_sleep();								\
+	if (!(condition))							\
+		__ret = __wait_event_state_exclusive(wq, condition, state);	\
+	__ret;									\
+})


And then in fuse something like this:

@@ -207,8 +207,9 @@ static struct fuse_req *fuse_get_req(struct mnt_idmap *idmap,
 
 	if (fuse_block_alloc(fc, for_background)) {
 		err = -EINTR;
-		if (wait_event_killable_exclusive(fc->blocked_waitq,
-				!fuse_block_alloc(fc, for_background)))
+		if (wait_event_state_exclusive(fc->blocked_waitq,
+				!fuse_block_alloc(fc, for_background),
+				(TASK_KILLABLE|TASK_FREEZABLE)))
 			goto out;
 	}
