Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE7F2BF3C3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073063; cv=none; b=sbYgMl67jB1SjtQApultsPxGXS69NXk0sGUIr35rGQsrBEkF0JdP8SYkymQKsbQGY6o+djgZ0XuPmJQiM5O140hzYBwsWOxrCrG4sPwvLd36xEtU7FwheWRE9VYPagPs2j6UdykJ4JadCJ6s5i+ZMon/fdEwj+PpnIJ8ao4fdIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073063; c=relaxed/simple;
	bh=RYGk8+VVg+FG2sEDJqIBppxtJnPISJADFzhkbeDohxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKSkMFp8QvfcXnFm+vS+dhT+coQfBnxvxEPThYf/q+k2XO/fcmwgJv0VB2O6DGup5OziGiSRBqkYPDMOdfLmtIx+0/aNMZX73EGMPsCVRY5pODLVSuAEid1L8oSnkEVJsdr+X5G4bBCS1kYZibfLW3eBKk/03DyyYh0iM3R1eaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=B8am0wsv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="B8am0wsv"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so24125345e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750073059; x=1750677859; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y633kjMIRrtaH8XsmtUuiW2CJNzynwkqzm256+V0uoc=;
        b=B8am0wsvHQAJPDYo26kSpHvE50zlaFhgaEcdbGuqJplSywLkPENnG1s0Zx2Je8XVRo
         ihc6g3qqBJqYOzqH/0YC13fCzB3Oh/kabfoVUgSbzubDTBZgear0YuAsH5WIAqR/9pD0
         oIURx4uLnkPvZ66IvvdfAQBNv7/5yk+b8IXoZDgGdZ23VRUhB8gOKGFOfOyn+zp+0iel
         zna2cmBIZ4pQCI9IaniRpk3Ms6j/tuBT89x6ruokeYgNHGx4a54Q/hp7yzVwMHUXXkl0
         uw32cX1xj6kFm3gORwJv4kjLNTAmPFeLgCCWZzak9EjotX3L1awAFd2vz4G9Cnt6YeX6
         LmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750073059; x=1750677859;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y633kjMIRrtaH8XsmtUuiW2CJNzynwkqzm256+V0uoc=;
        b=XgZ/XQMSXHGt2khSSbRLytV57wvchoEwa55DZS6CdvLIQLtRqSpkbebGHS+Ak57BN/
         mLiUKWVJOUCldiqJvePt983MX70eJYsjw9gsEOg8uKFKDsna5lrKQ0EdjO6FhWUjtRjI
         Usoby1km5ZrzJizeQaxhC1j28oNYQ+ZVYwPgdmQSJbQwugp4i5JWPJ8AxbVjJX8NMkPs
         M2gswN/GHsnxGFzWyvwoe/yH7i+Oy9BNegZs4RwQrjlUbQELkDIy/y0XgCcK3fCqgcfg
         3dlPYwJ8EFvFGUZuQdTHwMV6dTWRHUZUNIA148gZVeMNiFqY13NnFIkIphMx3nGjhbQG
         N1LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFGRvO/n/wGmgc/p4BXEq2AZc0NEi+pLK1fTUI9DfgvVw4a0dllA2RY6gih/8VqqFnDybjDyyQwa5jBCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFLf1TYz3H7q5qd7wg8eMPcEtvbYZ1KmNDLW1RpdbSUbRa0aHD
	YQ0ESDFYi9jcmbuptiqIKQBPpHiDnGYWCYHj3XEqBfkPKeZ2bNL+4jZYbx0k7MqjUMM=
X-Gm-Gg: ASbGnctAVWq4Rab5R55QoeBukSuZZl+3JDsFlLaybpvfl3816tbmgIklgkRAUL4Npnf
	W+VDtNJQhj2t6g7umeBZHtyhPXOWmzXkF9Ffrr2ING2W0623+k/lvAi25q6AjfNNzalc3O62fxL
	paS7Lp9s7XJ1DTiHNuM+X4rpGGpjlO24685fG6r1K9DzZnMp14NgaAdkUfLFv65R+Iwh/foFp75
	0ANf7lGG0t7+h9vsCNx4EIbdBUEvgSWQtw/sXRdoS2lqSz1cGokxKY2zUacF81iu7byphjn4KUZ
	MgAzx3ocy32IP89NLJq53Kfj4C0a9YLUnMuvdtuSkJ3vTm7yST7CyK1RrVAs/Tc=
X-Google-Smtp-Source: AGHT+IHtfazRSuYsyft8MUUE/xCVsnjhRlEfdqxQjJFcgVmcPTPpE27KR12sx+SwGyuiRh7fkpsvtw==
X-Received: by 2002:a05:600c:4e14:b0:44a:ac77:26d5 with SMTP id 5b1f17b1804b1-4533ca572f5mr87804695e9.14.1750073059287;
        Mon, 16 Jun 2025 04:24:19 -0700 (PDT)
Received: from localhost ([193.86.92.181])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4532e16a097sm146045855e9.33.2025.06.16.04.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:24:18 -0700 (PDT)
Date: Mon, 16 Jun 2025 13:24:18 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: Zihuan Zhang <zhangzihuan@kylinos.cn>,
	Peter Zijlstra <peterz@infradead.org>, rafael@kernel.org,
	len.brown@intel.com, pavel@kernel.org, kees@kernel.org,
	mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, akpm@linux-foundation.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH] PM: Optionally block user fork during freeze to
 improve performance
Message-ID: <aE_-4nMTvx3m9lmY@tiehlicka>
References: <20250606062502.19607-1-zhangzihuan@kylinos.cn>
 <20250606082244.GL30486@noisy.programming.kicks-ass.net>
 <83513599-e007-4d07-ac28-386bc5c7552d@kylinos.cn>
 <cd548b13-620e-4df5-9901-1702f904d470@redhat.com>
 <a4370ebc-b1ce-46ba-b3a4-cb628125d7d0@kylinos.cn>
 <aEvNqY5piB02l20T@tiehlicka>
 <ee1de994-e59f-4c6c-96f3-66056b002889@kylinos.cn>
 <775aaf10-3d19-4d5a-bf2b-703211166be4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <775aaf10-3d19-4d5a-bf2b-703211166be4@redhat.com>

On Mon 16-06-25 09:45:59, David Hildenbrand wrote:
> 
> > > [...]
> > In our test scenario, although new processes can indeed be created
> > during the usleep_range() intervals between freeze iterations, it’s
> > actually difficult to make the freezer fail outright. This is because
> > user processes are forcibly frozen: when they return to user space and
> > check for pending signals, they enter try_to_freeze() and transition
> > into the refrigerator.
> > 
> > However, since the scheduler is fair by design, it gives both newly
> > forked tasks and yet-to-be-frozen tasks a chance to run. This
> > competition for CPU time can slightly delay the overall freeze process.
> > While this typically doesn’t lead to failure, it does cause more retries
> > than necessary, especially under CPU pressure.
> 
> I think that goes back to my original comment: why are we even allowing fork
> children to run at all when we are currently freezing all tasks?

The same should be the case for cgroup freezer as well.
-- 
Michal Hocko
SUSE Labs
