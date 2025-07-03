Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5534424DD07
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543487; cv=none; b=pv2CXhMYglg+lJcoYwc1367Wzm3gwtrfaW3vXN4CPnYYqMUPZ1ccrMP1KfZo44VSyDX6s6JjZsBmMQoJUuTKSHixCRCdlgVIBn11HlNJutHna2juiXF9MONLD/ZnbQkCgO076cnDzzlE8QLeLMFRPy8OKIoXrqmFrzL8k2Ivm1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543487; c=relaxed/simple;
	bh=/nogJzS+miuOgy9lLm3YquczlvwVMxD5XE7nikBivPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ozw2HFuglVsxBw2AmPF+4arPlv0a1p3PikvFlgAXt8x02NDYiNh4Oq9xjHqis7KM8Cp8eYRKI1kSK2DUYIJsvJ+d73Kz1z5rUfPY4ai3tEvfNDXO3eiiQkBoorlLbrCXnTgfBU+v8jqqNx7Q2xqnFvgEQAD0AnvEc5Y7IVfDGL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Aa+yoyDq; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Aa+yoyDq"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742c7a52e97so7583962b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751543484; x=1752148284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HJ3vBTQ4JiVjumXvcDQMtUJDHe90cFdEOkb7Ey7yUJE=;
        b=Aa+yoyDqWjkrC37psFhdm5tH7DLJKeWvHD2ZrUEBmy05Fr6SYuCDAgZGz7LqHfMS2O
         fV4F05VeSTN+yEN1xh6bWnR2IXx/pcKj/+FksxCiQvSLHn91pxl/Dtn8BDcWJd8pgbgS
         qnOvMrxAfDmNVVyZNHInw3PtCOJLOTRCn7UbubcwJTUiSTcTfEmhwHs7VvN37uGBRcY5
         78getmOxlC7OhKzfxlpyM953LeLNOZx8uJWb8+EDHg+iPz91TglycT9+ra+oCsFKv+Ae
         DaNlF1Uz+w9wrJPPOmdoX5T3yn41goMN8rkbiunnL+eLYnGh48SYTAQ2m5bXhA17hOBO
         k24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751543484; x=1752148284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJ3vBTQ4JiVjumXvcDQMtUJDHe90cFdEOkb7Ey7yUJE=;
        b=P+4dXg7f0J7STnH4pHxfKus0UZb81vbKIYcP4lc9Rz0NZQ3qJeIKQD0+Pwm0j7YMT+
         Vw2CFXK+RIXm18Kh+QiyrMC1zprELQbKQFUgHVrrUMnnQb9bKXOo8/Jwo+XlP8p12ZtT
         XEKerUlCceNGdiWjWnhKeVRnLjSvWNSfGsFHlc7K6JNO4swar/qFw01p6HcSiU7D+QbY
         wcKd1lZGZkRJiIMQpW3wkOXjjsOG0qWhPqM4H74YSgqZXZOcVXjXMhX5E0odzIvoHvZ9
         TVK4AefEWUqlo9+GjGNmQtH/PK2bnR0rHH7VEzzYUjXj9KredSb7X6oz1qdcouF1oXXN
         96fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjO5KWkHPeoGHyqVhi/79XaajNItyezWyJTETXvQwblwQuE62bWdge6zz8F0nnXYfGUU0wOzkTfhaSV8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF9Xh6wwv1IPBArLIrAYLHL+R4LEse5u2pb3INa9S6DU+THQwa
	a5Ut/646FRVW2SDDDUCD1a0xMjf7qWuJ5gQz+tWpgdS1MQbkLusL9mxxIwiaLXB+nQ==
X-Gm-Gg: ASbGnct8U6mRqo+ywVJqsetQv5BT3EzNfXIXqsiXgj+XBDyfvrcd1f1n7AsUTnf61QP
	ANSuBb0aH6RTLkuFloPkI8A+IGkVjBjsj6H3IsiFBSuLvRgEdNvH3dalmG9ed2SpaSlB4Pf1bCP
	J59pgt52mwOCpia7uUV/OVbBQmVLf8O3MtwFAdLQAveFpcoMLmRYvajeLBQe0V8zWzQmDa5O1Gv
	vD2u2EbKWV3cX4RqUj3xTAmjPquFZdkopbs8bUQZLxKztv/Y+ruQ88I0Ojgrl9BxY5H3pLQ0aRM
	uqyMkdpI0N6+pogtIy9aGdtnqCpXizSit1GA1DtkLk5NRYaaCYLtPSJFceiAkdj/PrzgdJMxPyO
	do00xKtU=
X-Google-Smtp-Source: AGHT+IGl+Mm2s/k/fuR5BUQxI/znbfMUtN9A8HDAwCIsjUr4XfzW1DUHWvgqPGnyIzOz5jPjuCYMZw==
X-Received: by 2002:a05:6a21:6b18:b0:220:879d:5648 with SMTP id adf61e73a8af0-2240c0af7b0mr5056604637.21.1751543484591;
        Thu, 03 Jul 2025 04:51:24 -0700 (PDT)
Received: from bytedance ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3508116203sm10426309a12.36.2025.07.03.04.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:51:23 -0700 (PDT)
Date: Thu, 3 Jul 2025 19:51:09 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH v2 0/5] Defer throttle when task exits to user
Message-ID: <20250703115109.GA854@bytedance>
References: <20250618081940.621-1-ziqianlu@bytedance.com>
 <20250701083123.GA2784928@bytedance>
 <20250703073740.GU1613376@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703073740.GU1613376@noisy.programming.kicks-ass.net>

On Thu, Jul 03, 2025 at 09:37:40AM +0200, Peter Zijlstra wrote:
> On Tue, Jul 01, 2025 at 04:31:23PM +0800, Aaron Lu wrote:
> 
> > I wonder is there any more comments about this series?
> > Is it going in the right direction?
> 
> I had a quick look yesterday, and things seem more or less agreeable.
> I see there has been some feedback from Ben that warrants a new version,
> so I'll try and keep an eye out for that one.
> 
> Thanks!

Thank you Peter for the update.
