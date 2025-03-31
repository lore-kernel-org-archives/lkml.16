Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7621EEF9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743402637; cv=none; b=dje9+05SzSxJGFn+FnzRE+4yLJGiC2J7jo2U3VobJ1iuuO8JraTWBTTsgd4pnkkiSigPLyg8B8OZgCQjp6hoBB6uo3pi+jqBAIHQFKihktaCXr2PUF5vkVma3O0p1fGLr60iWNmuRfHSrDnJpFJiqYbGxGmyZ9pg8TGWNgnJdMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743402637; c=relaxed/simple;
	bh=AeZMObkK/QaazZiyudrvlCu5jNXsOijFIL68Q4aIAQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/qzOCPJ6RDi6S4Om7xQOIrxuH399/nIAM17BpEIcRGROBznJIUYDUbm4TiDfS7rBe/OVo5jdGvYiD04lpWGBK2qJpaw3AktPL62q4WkrDwlqVdtIAgxo1M00qTw7gVlIcU70VyHNmDha3HVxW7luVM89rnl4aeRBJ8EW93ZX3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ad2HZQhA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ad2HZQhA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743402634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EMhzPoniTfYWN8ZgDNTklznq2jNHJBvJOb88G2T5SmQ=;
	b=ad2HZQhAgfU3ifagIaPRRIpkzTG5+MfqvekD0bBr/Gv15H7AlI3Xqmalcdl/BnVxVUHDHA
	2NG92K98r7rhbiXlcLAgKlYzptzgP2ZIIEbMpqWq+yMwEosXf79KEkMmU1LHcTNEC6M8Mj
	HVjbDhMqFDYzsBPzpqFUgpmtY+PtxrI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-G07dtCZpMXqOKRWeDoqxWw-1; Mon, 31 Mar 2025 02:30:33 -0400
X-MC-Unique: G07dtCZpMXqOKRWeDoqxWw-1
X-Mimecast-MFC-AGG-ID: G07dtCZpMXqOKRWeDoqxWw_1743402632
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac31adc55e4so340567566b.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 23:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743402632; x=1744007432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMhzPoniTfYWN8ZgDNTklznq2jNHJBvJOb88G2T5SmQ=;
        b=s41KVZfi9NeARtMeBJBQ7QNZf51YKm+XBowa97dyYeatBxM+8UqaXPVRYTnZvsLRpe
         JtpHI3+HKLJLDAsh1LgWoPEkTX+G01ysL9/9MxDYkgAuRQyQA7X/NhhBx3Zw2L16vbRo
         jSd3iALWaMCZnyVtXeNS95K45Sb4+tbcoTWm5Pgi2v0dmjx3VCqUROL37GoJaY9WwW76
         AdJl78cNNp7EXDPSnCukGEFQymA0tC6wrOA77eHV2flwJ8pz6/5dO9m3e9gCTnfbMa8X
         Aa6829mpuz6FG4pxQbpBhEsp3KJWocLVtVAVFryhal3P/WQxx6HyB3uZ3FGx8qS6MqKj
         /9cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXea1+JthhcENiU+TCmwZNa5o4qh5AsC5IHu1DIqXzItYBoYje43dqG7LW1uEjxato5hMhgWO9WFuI56A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZxiTfqtJw2AxcmnCy7zFcU5E+A0mjdgpfwQcVTIsFx0phfDIy
	3BgPflibNo8KIV86ixVdKu8jQGdAWAsOAlD5B4w0e+GHbXiFm3rGyD1A/vyCzKZyAT6CJuy+RDR
	n5wAdJBDuzq0+kdfYT5hTuv94zQOx60Y6fT2LReznIUXYOcXbui2SCDzSkcEvwcq/CP3jTFEUOy
	z3LeWL9pr9aNINDTq7QHioqA7iJS5jQOBpm2MY
X-Gm-Gg: ASbGncsV4btXULJaNWc2xyWMVPnYashD+uWerIeLlMByCM6xB7f0kYaTDri/8S86xBl
	MS2VzHC2qbCcld/7LU/Yc151hhoYKD4wLKVBogJyXwcwTZr+hKmWK97j/ReoM9ef1Rxwo6YKYIK
	DpYRnWKMNJLC8Cy/+qLF6CJ7a+Rjk=
X-Received: by 2002:a17:907:9693:b0:ac7:1705:a86 with SMTP id a640c23a62f3a-ac738a0d32bmr719196966b.3.1743402631712;
        Sun, 30 Mar 2025 23:30:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6RdegHcqRaJjXTmFs/i/IFW8n/N8N4TD8XYvjQCcFTYTt7fKCRVjBhw4dwhhumP8ELdRR0n0cNgI1/jOzk7c=
X-Received: by 2002:a17:907:9693:b0:ac7:1705:a86 with SMTP id
 a640c23a62f3a-ac738a0d32bmr719195566b.3.1743402631338; Sun, 30 Mar 2025
 23:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330184641.1929409-1-costa.shul@redhat.com>
In-Reply-To: <20250330184641.1929409-1-costa.shul@redhat.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Mon, 31 Mar 2025 08:30:20 +0200
X-Gm-Features: AQ5f1Jqff5rlw4TphOFCW4Jy7FGhPhZjVYJkSlX_qoNC9iL3ocvhNvNB2I2h66c
Message-ID: <CAP4=nvS7nAfrMfb5L8A4DU0ZtGY7cxVD9gTLL-xV9jW3rU1rTA@mail.gmail.com>
Subject: Re: [PATCH v1] rtla: Set distinctive exit value for failed tests
To: Costa Shulyupin <costa.shul@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, John Kacur <jkacur@redhat.com>, 
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Eder Zulian <ezulian@redhat.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Jan Stancek <jstancek@redhat.com>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Costa,

Thanks for the patch, this is really useful, as we will be also able
to test whether rtla properly resets the threshold option (see below).

ne 30. 3. 2025 v 20:48 odes=C3=ADlatel Costa Shulyupin
<costa.shul@redhat.com> napsal:
> Failed tests return the same exit value as passed tests,
> requiring test frameworks to validate results by parsing output.

Please specify in the commit message more precisely what you mean by
"failed tests". That is, when running rtla with threshold, the exit
code is the same, regardless of whether the threshold is violated or
not.

> Set a unique exit value for failed tests to
> allow integration with testing frameworks without parsing output.

Note that this is not only for the test framework, users might use this as =
well.

Also, users might be already relying on rtla exiting with 0 on
threshold violation. What do you think about adding a new command line
argument, `--fail-on-threshold`, that would allow the user (including
the test suite) to trigger the new behavior?

>@@ -20,6 +20,6 @@ check "verify the --entries/-E param" \
> # and stopping on threshold.
> # If default period is not set, this will time out.
> check_with_osnoise_options "apply default period" \
>-       "osnoise hist -s 1" period_us=3D600000000
>+       "osnoise hist -s 1" 2 period_us=3D600000000

In the future, we can add regression tests like this:

check_with_osnoise_options "verify setting default threshold" \
        "osnoise hist -d 10" 0  stop_tracing_us=3D1

This will detect failure (return code 2) if the fix in commit
0122938a7a ("rtla: Always set all tracer options") no longer works.

Tomas

