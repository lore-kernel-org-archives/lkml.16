Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EB31A841E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745343425; cv=none; b=Udtsg5J/KRaYR/3QtWEUjz+Vx7dv/zFjEFDgKDDkaHolP0l6ygVFtDPz+Whl2IKT/QiJ2DwNiGdavO1/Gp/W4hp0JNjjIWkV3ByN1qOAqkFKVMXSBFGfXnKBwW/cm0P7lFPzSmsondlx6ZjIyzNZvbHWcSroL5ugAOFnCYEL9Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745343425; c=relaxed/simple;
	bh=L1NuLC3M9iOVcIS/tnSiORX9C+uzimIbziX78n+Rcqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQ13JaT2HsovBgQGbXHevhgneaSD/QlnfoohfwLbP5yUSUn9IQL5CwZcdEcvc/RB6I8nddmsoup8npZA3x6O/tQbiDIL67UFoEVM7lYLK30uxhZ7gdmDvNong82PjQ1UycfctQQtLK45GKasPaGhwiozEsagAOrx/qvh4G9GS9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=TKo/FiGH; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="TKo/FiGH"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5e39d1e0eso534141885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1745343422; x=1745948222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hGlejZf1M4uB6/02tIygWhA14axEik3yrFkQW21it0I=;
        b=TKo/FiGHh+AksseN8OCSZ0UA8zarshdWvPi95x11HTMY32Bw9mvzswkQ+oGPbxKUdz
         fTLOPhgO7MnufSTmSjfa9bnay4iUX93V6U6Z+jbBtIg4p4rIdH1ZMp6UyswJt4r695GL
         1QzLtZFwkSK9Q1ahMb3z0P9tJc0n465X2VZk4qlPPo6xFunWFJPBYhG1WyvRXodp+As6
         HisrQ0wyFoopRI1Zy22LRJsdwpx8JHzzz9u9xr2nJleZ+IUUr37S04sO3vF9Tlr7RiYw
         A+fRAP8BH99x8DW8dWBTrHT8yLP7Yto8QpIRlAFJmWLyx95zNaDXlaETfDANTsSb50ok
         c58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745343422; x=1745948222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGlejZf1M4uB6/02tIygWhA14axEik3yrFkQW21it0I=;
        b=MKCWPmU+zyenk4AHE0/kyUIdCjdyGL3Ffaf+VVYX7gDT31MU7cX37vp1VTt6njDyXZ
         zIPSaZD2mefc9VwQfL7ig4ETD6dFeRGqjCvk1AeDR17V+1YMZsrLOvdK3uWbgkahtxi5
         IACKQ+tt1CL72m2iYCB69p3mMXpogojzGFldF4hV5w7I4geDG53kkznjcLmeIIiOeke7
         DhMBJcGMao3eiXZ7wtMPCWhsQgbT243sQNSA8iFNQU0N/3zcfaGSp4hwQn0YZgOI67B4
         Q6q6P8Y8Z39KkKMw32wOLxxXe9nqq2UdTT1DvQrNimJbxreQjRrz0xuorIUy1hInzdkh
         JWBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9ZVOxdtUwJriLpNF34DbGGmQ0wjlkApdIUZjFL/zoaoBOKznwQdogKK2D6b4fwuvXHA4vr3MKhPT0tLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJrj29lpgPqPJ5IhG9h4YKxkjraG+Pph9ZsD88utbqB8uhvgQG
	nyEXqy5fGtSrwBvqR3zakk5k90cpqPO4U2KV+jA25eh36QLB1BJmHCVN5q5RiEo=
X-Gm-Gg: ASbGncsY7KwemWtZ2mJcUpZq6s1mgmwskuggYt+btwcZr4j9EmkyiMC6n4TlwjNvY9E
	tM41oB0sFCjTAYZHcqb2ga0i2yc7wx1PZ8BJ/OmO/HOU+rOYLom/sXyy2OP9moobzQUmDbfbYKz
	ccduN4YeCTNOfS332X9eaJkNck6pTo7hn/CKD5BG36D9m0o9ynvkCRnziOHLi9DGKLMfFRoXEYk
	SlYeJZX8uL4JXCwHpMllsO2eUL7SrRA9Tc7LMKgPWlY7rNCDS5KWPDKXth6GyVPQElLemux9/QI
	4Ep7SnFRCGLIhAXt1qxy8ARc6I5FZpx2JYYiz+M=
X-Google-Smtp-Source: AGHT+IELDUlKcoCTHzBX8I9XSIjxg7eaS3ClKXEBzXDWD4aDyg2hvTE+Wb1eoZHRb6LlviHxQ+FBOw==
X-Received: by 2002:a05:620a:c42:b0:7c5:54d7:d744 with SMTP id af79cd13be357-7c927f99feemr2428682185a.23.1745343422011;
        Tue, 22 Apr 2025 10:37:02 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c9280de4adsm556929785a.114.2025.04.22.10.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 10:37:01 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:37:00 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	longman@redhat.com, mhocko@kernel.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, muchun.song@linux.dev, tj@kernel.org,
	mkoutny@suse.com, akpm@linux-foundation.org
Subject: Re: [PATCH v4 1/2] cpuset: rename cpuset_node_allowed to
 cpuset_current_node_allowed
Message-ID: <20250422173700.GB1853@cmpxchg.org>
References: <20250422012616.1883287-1-gourry@gourry.net>
 <20250422012616.1883287-2-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422012616.1883287-2-gourry@gourry.net>

On Mon, Apr 21, 2025 at 09:26:14PM -0400, Gregory Price wrote:
> Rename cpuset_node_allowed to reflect that the function checks the
> current task's cpuset.mems.  This allows us to make a new
> cpuset_node_allowed function that checks a target cgroup's cpuset.mems.
> 
> Acked-by: Waiman Long <longman@redhat.com>
> Acked-by: Tejun Heo <tj@kernel.org>
> Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
> Signed-off-by: Gregory Price <gourry@gourry.net>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
