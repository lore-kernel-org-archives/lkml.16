Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B951779B8;
	Wed, 11 Jun 2025 20:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749672118; cv=none; b=J1t8oqtx1QNmGe3EiuZFPr++QKS07/Ay2CmgA94SYfu4+3ihj+TbU0fI1hVi7i+4O9WsJ1jF9cBI9WtpBSmcJNpKCMlMYrIckEGRHBysk6CFFOOfYiELD4PFuepjsYd+e5Hx1IPLCMLwrjsjVV4w13QkV0azanxhldJeAp5thig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749672118; c=relaxed/simple;
	bh=M8uEt0SnHdIXnV62UONCsrgyaseuQmStaQjjoOYp2qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p60I9OBOQZ4UC9+/2bvTWyUrQpiMpDlDVf5WjVjp3A6ogTp7OErtS1GsjxQE0A0UTQjMwu/jb+16hRpZXFB7vG7NK7HmL33pnveJYh6OtRtZYFuR6GSj9lDdpazHZ//UbsRh7GYz+ARxMfHMwTbfsx49TJOXpsE+klZhRK9nsKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fytIJ6jj; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fytIJ6jj"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a43d2d5569so3669491cf.0;
        Wed, 11 Jun 2025 13:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749672115; x=1750276915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo1T1w5Sm385t0bg/df5NG8clj59nwIX7gQBQcNhWj0=;
        b=fytIJ6jjwuLezVC9wjKpLq5M62KtGzkKNgpcTtc9gZls+Rsnm/ERRfhO3SR1SKh4ZA
         t7+S2GAY6ZSchXxwiflQfyL7pgGdkVTT7do/OeJy7bpvEBi5Z75khUn5itn7y+duHyOU
         EnWdtvk5XkIdu9cFktMgvjlS946hrTf3NTDgSzVjDOg91O4oUdd2lAaBVxF7FBUpZTs7
         baDBpXVTPHLCuUq6T0B81CgB7XuBCpuVglLnTO5EFPL+hrivQF8kB7ZAPqM1pw7gygGr
         YQu5rDj6zQjatMdKlM/xNc5sWXivdGspghH/KLzErfWXXrqSvfkrvZTeYPhRbQBy2PnG
         cZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749672115; x=1750276915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jo1T1w5Sm385t0bg/df5NG8clj59nwIX7gQBQcNhWj0=;
        b=xMjnCE/XFAMN4DlPv/s6Ln/YVgpCzpEM3E5KDU3bKo0NRkofQG3WDu5gucrMQUJAwi
         JfmrKqiMIHqaF6JBxXzYFxP080CDX82Yw7SVnTQmXrZ5bsBSit4dmt9gG1h4wE1PhaVr
         AIDGOBt2mWZE4qAd2C01mK8umbZ19p/azowx9cVNr8Z1o9nyn/JizIZ/WcBYQRgMGnDw
         E2abfWjJxJ8I1PtV1bIf1NuT1ycfN7dYTr+keEVZ4juFMwKhzPTb1HPDFW6w7NyyNMF5
         bB/POQXC2Qoa1oBxZVin3idcIReMZ4nFM05yeuqIcJPLE+Ec+6fnaFJ7rul3AU08fT37
         GrKA==
X-Forwarded-Encrypted: i=1; AJvYcCVuy1EJxzUJhP24ABIK6Y4M9U9bbmd7zsdkFHDqm9jsQA9gmysyr/Xislqf2tOFdxgP7kCciUYw02pkRAvcAXM=@vger.kernel.org, AJvYcCXVsRD9OhloyxvF6YcSlStmUPstQf40I+h7G5U8ngoqtjRInhuosPZDioUj+Qi8rl2BaaXSYrAJnj48MR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxinuxfDUaPoxpD2EZWyRuSA01yt75gaphRkhMC0th57YeUCc9
	fEVlER+npD53ofVjfz554lOH3CophbmO3aZ1teOXe1DgHallRGziXego
X-Gm-Gg: ASbGncsxf1iBZU5ZGf7LsxvpJEEz2OkxxF1uhybLdiTgq/jOovTCIJsXLR+fHCbbw4k
	wp28182q2IpvpiFb2koMQ2I1vtfRQVNMVYEbMCr2lBqE/EWhnNd/npIP9fYXbNITk69UDg1XV7I
	dDbiPOFIRn1ttCk3qB2I0i63uuH+9tR+NokojUxOeYMGkcY6bjLQnqrnpGDaH8O3NZcaRqJDQd2
	NfMrhdFm7o2/7aJaBuNyG6oZTkQu5X6Di3qlu7S1+lbvFDtVdwr0E3CjifGsOBqQBP0VJ6go/Ni
	GZIzy3c6lrnFuivxg6BaDNQbJ04Y/O5GTnwlxHOgAfwtOyP5Bjk9huvTqup327T//MtDNKteBkR
	QbtwyOGPTQ/KZ9gZyQAcleomy3OL1vvnda2luXXJWFtCMPmXYpX8n
X-Google-Smtp-Source: AGHT+IGDFvxHUQFOJsK4fq9EQ3UAjRgZ4ccmnAHDpsTlgOd06snNOJkq11EElXrdBX8UMaOgOkP5UQ==
X-Received: by 2002:a05:622a:1929:b0:4a7:189b:98ad with SMTP id d75a77b69052e-4a72293fadbmr21285491cf.14.1749672115366;
        Wed, 11 Jun 2025 13:01:55 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7248e1ca9sm221181cf.74.2025.06.11.13.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 13:01:54 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 16BB21200066;
	Wed, 11 Jun 2025 16:01:54 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 11 Jun 2025 16:01:54 -0400
X-ME-Sender: <xms:seBJaFXsZplErvNgtdIQu7dQu2V06NgGvLO9ms6eamlM7LNd_D6i7A>
    <xme:seBJaFkaeaXfnPRJrFRDSBMB1Mw5d7YcUJJVAISR8AzwBo-iiwgbaqh6UXCY7kp9o
    cTbhZpLwqIbtRIGdg>
X-ME-Received: <xmr:seBJaBaGqLFhPvbiP7SG5yZMniv8uUgYNPv-119ag00G3SH6xVAOTt0r825Mbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddufedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvgedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgt
    phhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtth
    hopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegs
    vghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnug
    gsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:suBJaIVHZAIaW8ZLWkrcexaOiYtzuEW4AlcikClJ0WbKSRJgQmMv3g>
    <xmx:suBJaPm1053HF2juV7R3ntYGKM_MzmOLpgeal50dxal95avqBKf0LA>
    <xmx:suBJaFfNFJljxv2XsNbw93cFrHuSLeQnVSnXo9f6EC4BFDLNZEnQ0Q>
    <xmx:suBJaJEpKQ_DaPqKMGoHYQsH17IZ5p78NHhMI2be7WTexvVZd2OCFg>
    <xmx:suBJaJnFO4j7hvEL0GjGA1mNzZLReqSdkBf8IJ9oP1TfOTUkaUYDH52N>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jun 2025 16:01:53 -0400 (EDT)
Date: Wed, 11 Jun 2025 13:01:52 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, chrisi.schrefl@gmail.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH 1/3] rust: completion: implement initial abstraction
Message-ID: <aEngsOXTFsFg-RkD@tardis.local>
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603205416.49281-2-dakr@kernel.org>

On Tue, Jun 03, 2025 at 10:48:50PM +0200, Danilo Krummrich wrote:
> Implement a minimal abstraction for the completion synchronization
> primitive.
> 
> This initial abstraction only adds complete_all() and
> wait_for_completion(), since that is what is required for the subsequent
> Devres patch.
> 
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ben Segall <bsegall@google.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

There is a DECLARE_COMPLETION() which allows to customiz the lock class
for a particular completion allocated on the stack, but we can add that
feature in the future, the current abstraction looks good to me. And I
think this should go into the driver-core with the rest of the fixes.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun
