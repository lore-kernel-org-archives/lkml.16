Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D969E1FECD7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039522; cv=none; b=ahFERuvozFh66/26hycPGgaJnhKYnIjZ3cp/W8BCkLNcMnDHrRBaP3Ai/eSymn70oYopDc4SmykDfe8eSSRq4Z0o9Rf72spRKuvW2Rn2uROI4gIfwpKd5UAM9N4Y18FQ+ztuG6UOLdGJCVYoF3qMVujzkNMnoTT57RJc/bNfd8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039522; c=relaxed/simple;
	bh=P/Ks5ThkyG4NgbSPXxPyQOvCZo0EyEbEsiYV97hCPbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHF2rirUWX3IJhfCAHkdMQDhy5KL1EltIKnXeWv7/3ej4FidZLikbeLVfC2g9xKZRF1nJeFii/dKaS4LIMt7BxLmoI2AtIjhFSbrGB6kTUB2Q8xLgu6vE0UMFVpoMXUbG9qjwQKyzFEY3jWhHeo0TcDJgijvuPX8EH7oi8PnG5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YxrS4pTq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YxrS4pTq"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so42002915e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744039518; x=1744644318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rBI/ctOg6rttQTImP8b9T2x38eCYUNV1RiePYdYKl88=;
        b=YxrS4pTqEbn8hx1OqpN7VI3d1itcVhX6fPAnLD2BmN5FbOSrp05YzUtKKTtt0zX1Sy
         O81POSo1wvCeLOaDXfoqaTymFaCvq07zPXoC8hFIQhAn9VCQ9v6JzRNjOaE84pozzT4y
         DpOHh+NnBi0sCgMJKfGhHDiVnxH30W5+gsZPkdMAW2e+dZrt2XNvDPuFo1s/7IRc5+7x
         neDmuBORgGlfMgXOb37Xc6piukpuXd79TShQsQYxOws3PspwPfvQZBiV/HJ/pFKRP9N4
         hI6BIJQA/d25Qp8iIj1iukTY9s1hKCy2ls1sxNLX3Z49to+40bDCy1QK0d9WVcbeOkw5
         /aYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039518; x=1744644318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBI/ctOg6rttQTImP8b9T2x38eCYUNV1RiePYdYKl88=;
        b=LV8VjjYWLzllDdObpVj6rOLckbg7eZDihd4zLkXsd3XEOAuEfJ/QBv6wyruXDAIOBL
         VI5hjflZTZ1YSHDvPWRjImXLQ14AnH/bQXl3SwUF4cpAArCOnHv3V7QxSmbd0yXeOjpK
         xSN1utEOcEPV6v3qUwWcwVT7pjsYS6oUT8OdBVsnrF410sqb4mrFNgWaV9CDbJ9aFPgo
         97ESg/BIak4j6vP5YGrJRJvHmj0yUyS7p/zjMYDJK4o1an+yhHMTAEaXd2o3JchFbc7H
         6XqtlaMcg2Xs0liMGBog9f3fbaW4Pg2oIhbr95QwnYBDo7vuDVst5XUKcu593GrmFXMM
         vMZg==
X-Forwarded-Encrypted: i=1; AJvYcCVODOfz2iuuYivfv6/WqJIE5/zI5YNPScN7ODHl/u/W4Fh7Qf8A2IUmqei6Yzgmp2jPbf4SNX2NxbMwcvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyec8rb3wZSrpqYUW14wYM7/gCtd8+sBDpYEXUpbmMvtlyU4NL
	4xaD+n4nbapypYx/+MAFKe6XHKO0WplAWedNVqTkhHCUeQibuqkyL/0zrcLA8xA=
X-Gm-Gg: ASbGncvW2CoQhAidx9EyiVzK+6VSLc1aklwAAiUrlcf4PntR6VtssAYwfRFA/MuQ1eE
	oOnhCyrDHg3qf71KHRtNf1vplCY2WoG9b2+C8YtYIKmkC3Rshdc+S1P3CNC5P0hRRpN4FR6cQ9s
	ntvfV9+QmvGdY7iL1sTz9H5E/uFM+Yeu5LHoq+E0RQQRwqF7MZkYTk/ll22HzP19GVnOKGbYJZu
	65wiiCkEMrIh8IR3LYTDd4QbXYwsi2eOWNKOaBWz3rpZfELQhx5SJZSHM1sWJmR33Of7uBstWZu
	NYbOOu631igXvUO/8hmST4qGvY1BBNVjzPkkx9MvJfwabhjkM0fHbAmxGw==
X-Google-Smtp-Source: AGHT+IEuUH3J67sjhqDoixk/QkJ0y0B2AA37FiOvvQzo5BNHB8IYmL/PuWEwjrbhfyj5yQcGP3H1UA==
X-Received: by 2002:a05:600c:3b08:b0:43d:b85:1831 with SMTP id 5b1f17b1804b1-43ecf585cacmr129997875e9.0.1744039518078;
        Mon, 07 Apr 2025 08:25:18 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2ffsm132570725e9.22.2025.04.07.08.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:25:17 -0700 (PDT)
Date: Mon, 7 Apr 2025 17:25:15 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 1/2] mm/vmscan: Skip memcg with !usage in
 shrink_node_memcgs()
Message-ID: <awgbdn6gwnj4kfaezsorvopgsdyoty3yahdeanqvoxstz2w2ke@xc3sv43elkz5>
References: <20250407014159.1291785-1-longman@redhat.com>
 <20250407014159.1291785-2-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lu3xupyh5hd532gg"
Content-Disposition: inline
In-Reply-To: <20250407014159.1291785-2-longman@redhat.com>


--lu3xupyh5hd532gg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 1/2] mm/vmscan: Skip memcg with !usage in
 shrink_node_memcgs()
MIME-Version: 1.0

Hi Waiman.

On Sun, Apr 06, 2025 at 09:41:58PM -0400, Waiman Long <longman@redhat.com> wrote:
 ...
> diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
> index 16f5d74ae762..bab826b6b7b0 100644
> --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> +++ b/tools/testing/selftests/cgroup/test_memcontrol.c

I'd suggest updating also the header of the test for clarity and then
exempt the Child 2 ('E') conditionally from comparisons, something like:

@@ -380,10 +380,10 @@ static bool reclaim_until(const char *memcg, long goal);
  *
  * Then it checks actual memory usages and expects that:
  * A/B    memory.current ~= 50M
- * A/B/C  memory.current ~= 29M
- * A/B/D  memory.current ~= 21M
- * A/B/E  memory.current ~= 0
- * A/B/F  memory.current  = 0
+ * A/B/C  memory.current ~= 29M, memory.events:low > 0
+ * A/B/D  memory.current ~= 21M, memory.events:low > 0
+ * A/B/E  memory.current ~= 0,   memory.events:low not specified (==0 w/out memory_recursiveprot)
+ * A/B/F  memory.current  = 0,   memory.events:low == 0
  * (for origin of the numbers, see model in memcg_protection.m.)
  *
  * After that it tries to allocate more than there is
@@ -527,6 +527,7 @@ static int test_memcg_protection(const char *root, bool min)

        for (i = 0; i < ARRAY_SIZE(children); i++) {
                int no_low_events_index = 1;
+               int ignore_low_events_index = has_recursiveprot ? 2 : -1;
                long low, oom;

                oom = cg_read_key_long(children[i], "memory.events", "oom ");
@@ -534,6 +535,8 @@ static int test_memcg_protection(const char *root, bool min)

                if (oom)
                        goto cleanup;
+               if (i == ignore_low_events_index)
+                       continue;
                if (i <= no_low_events_index && low <= 0)
                        goto cleanup;
                if (i > no_low_events_index && low)

--lu3xupyh5hd532gg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ/PuWQAKCRAt3Wney77B
ScwcAP46No9qCK9KNhyaGyrJbha1L6AsoeFeO9BW0ZboeZ5NRAEAvEX67kbDxGFX
Obe817O6E0lDvyjPXo6bT4YSjrBk1AQ=
=yLF8
-----END PGP SIGNATURE-----

--lu3xupyh5hd532gg--
