Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29581EDA3C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751100303; cv=none; b=AdWP24FuBcP4qgUq+3ECP4MN5mPgds1ZbUTsCia5iOWY/skG7VDgFKkT5ICz29gh5jrQLPFz3VnlmGiZLYX+LXx17hAJwjJvTZ3V/H0cfxxGpwYgwP158ubYpvJrp5Zw3JjT4u5Tvkh0P6o1BfskOFpLz8mTr4wpe7aK7hiwBMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751100303; c=relaxed/simple;
	bh=f3o9OoZUEbBDeBbUxOB3GnLGKqZpAG8HFhx3v3nlo/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xhzly47OYXF+LjSY17l09LX/ffdvvJkjiRR2cfpOcahr8RM23Fx+Ssr17d7EEnCPhZMv+vxNWcm2ouWPvlp8PL3FLZlhU+VFRQj+LHIkFDtMSMACUDiR6M+3fJjw/qGAb4xPEDIFCLYRlD/PMysCBBZQbgIGQt2yfB/UGVCKXOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B08+/v2f; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B08+/v2f"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a6f6d07bb5so7399811cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 01:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751100301; x=1751705101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nmnfrusCNXdjpYHJ43O4MY52XtsNNDAe7B32gXZR/A=;
        b=B08+/v2fGg+9DMi96O5lWHnkIwL9hBfG/wZVW11A3dfylVQAL7PBgRCbPFXewsYolW
         TBOPcyswj4KZIA3xmvaUE3mScm81a1s1Xg3IkUvcShQSgi10WLhImnOKPbKQP+0c9kN+
         NA/19wHB6OkvJYnmEH1Olmu3rsHPSbCsOxJ2dYdPWM8IO9p3NLF6phfpO1TjYKiR9qlz
         Gf6JBgLNnYVnsO1okmSa9xLVtEOOG4yMg/tn7QMq2oixJch0oRuiagCEDZEuvLUW5NbU
         8Ik5rbUzyAbfojkRH2WYm+HS8X6Zq8+dWOr36Gslq5o8wuN4aPC8wZNS9xW0OVoTo9W+
         zQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751100301; x=1751705101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nmnfrusCNXdjpYHJ43O4MY52XtsNNDAe7B32gXZR/A=;
        b=LDZAv5xOUeuSq1JUm6YW0wDWJIZD7Rru7NMoCA9ttDmBFCsuNuOTHCS7+5xIEy2Wyb
         dCTaAMI4+yWGtwTNQXcHprREOhtJNYEi9mZut7EQGyyEhhwG5bgy5adtVmonpUFXL5FY
         wi9R0FQjBqjrw6TTZ22VZ9wWWv9b4duD/SrER2BKYz6poxehkZogFOIChmAGjHWpbsOO
         3rezcMHEXFj2HIlFs/fE7hwXiaYv1ojDZVvuugwfQkh1k3FI29CSSwdkXKQsny4AO5Xi
         E/zhEv7qB8Ifnjp8WWYVrA1zOa7jqATlsefSrnq1HRAkNEhpNby/J5o1G4KoDX+RsDgq
         YF+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYeVXCBAKCJRFWYLqMeLxnSVziHRppAmNPBmg1MtePTK2TpLJDVU4lhw8fMP4drMJAQe1Q4nVACxkq+OU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrVJeyWCk/bGTDlecZmpaL0BCqxzjza/UqetaIO7RqWzKE6SG4
	wajSo3eWOiLxZAFp245voDC4G6rSDuWtHlVAt8n1/hYBwRgAY5Xnhed7Th9EdJeOIpwQxJlRA4G
	nrPhDcASdJ/PGIU1dUxwMMZEHe5od+XXl1C82ovP9
X-Gm-Gg: ASbGncsrMYuPM8MgueHznrOu7mBUj7DV/F1wEG7T7BPYV7T3nbo4OhliouHDi9h4OTS
	hyitXPfU6WuufmdiuLinOCT2PaGOGvte0JaVXIaPkqe4mK7/W2aoJWuNYnKopOYe9kg6XrW6+gD
	gWjekM0rvI19z3P747TbnC9WmFOehz1yc2TfbCMPpXxYHx
X-Google-Smtp-Source: AGHT+IEOmVnyFajIJ8a0GhgPX2/JYD/n70Gv15+Urivpy9ZmnV3HQI05bvkqKXfOyYfw16w5ldtEaRL1UFR0A99MQpw=
X-Received: by 2002:a05:622a:1a27:b0:494:993d:ec2f with SMTP id
 d75a77b69052e-4a7fcab93bcmr96209851cf.12.1751100300350; Sat, 28 Jun 2025
 01:45:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626083512.GT1562@horms.kernel.org> <20250628081918.523857-1-malayarout91@gmail.com>
In-Reply-To: <20250628081918.523857-1-malayarout91@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sat, 28 Jun 2025 01:44:49 -0700
X-Gm-Features: Ac12FXx7HbqsaSi67Ecn8j0W_HA9gHLw_rRrRWO3BQVTSD-WwmLZmje0U1gXKqQ
Message-ID: <CANn89iJUz2EXu_h-YbiNswixHo6z1EwcmQrfSk6o-MmBznWfWA@mail.gmail.com>
Subject: Re: [PATCH v2] selftests: net: fix resource leak in napi_id_helper.c
To: Malaya Kumar Rout <malayarout91@gmail.com>
Cc: horms@kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 1:19=E2=80=AFAM Malaya Kumar Rout
<malayarout91@gmail.com> wrote:
>
> Resolve minor resource leaks reported by cppcheck in napi_id_helper.c
>
> cppcheck output before this patch:
> tools/testing/selftests/drivers/net/napi_id_helper.c:37:3: error: Resourc=
e leak: server [resourceLeak]
> tools/testing/selftests/drivers/net/napi_id_helper.c:46:3: error: Resourc=
e leak: server [resourceLeak]
> tools/testing/selftests/drivers/net/napi_id_helper.c:51:3: error: Resourc=
e leak: server [resourceLeak]
> tools/testing/selftests/drivers/net/napi_id_helper.c:59:3: error: Resourc=
e leak: server [resourceLeak]
> tools/testing/selftests/drivers/net/napi_id_helper.c:67:3: error: Resourc=
e leak: server [resourceLeak]
> tools/testing/selftests/drivers/net/napi_id_helper.c:76:3: error: Resourc=
e leak: server [resourceLeak]
>
> cppcheck output after this patch:
> No resource leaks found
>
> Signed-off-by: Malaya Kumar Rout <malayarout91@gmail.com>
> ---
>  .../selftests/drivers/net/napi_id_helper.c    | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/tools/testing/selftests/drivers/net/napi_id_helper.c b/tools=
/testing/selftests/drivers/net/napi_id_helper.c
> index eecd610c2109..47dd3291bd55 100644
> --- a/tools/testing/selftests/drivers/net/napi_id_helper.c
> +++ b/tools/testing/selftests/drivers/net/napi_id_helper.c
> @@ -34,7 +34,7 @@ int main(int argc, char *argv[])
>
>         if (setsockopt(server, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(opt=
))) {
>                 perror("setsockopt");
> -               return 1;
> +               goto failure;

client variable is uninitialized at this point.
