Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAE72DC321
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646052; cv=none; b=S9ibXQLX8DI2n8Chj83EnQ2iJ8mbzbhR7kPCqWabttZuA0ZDzsCgD/fz3PaorUc/IEEZoMyBqTW0MLRlVx2PWMMTvw76CEVZjw2AqAcn8mC7v4R8ZQS+U+b79E1sC5WRnQxyg68gD6PZA/KP4WHybSkFqbm+mhPANO69J+Ay22A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646052; c=relaxed/simple;
	bh=Vw1axICA6lHzwM7NB5Mc0856OTH7uhitFoFBSnQMuIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gd3D97rCNPY9PvZu66iF9nk3/45cfeyrxmOHKMSy85tlcdUzev6NiHMOuJn/GJ9esp/N5pW/fIcmHcJ2DknLYvDiSEAoLlnX/r9AKbKTQc1mEkHT7nKP/178BwBFD62jwwoSPxY5MOkA6gxCCiUbOxg/Lqk9a/bwr+39X5IjLos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DvJw7Kh1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DvJw7Kh1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751646049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E/Z64A1L91eoVM0oVYxeXCv31/CXTq/WMm33nMh52sU=;
	b=DvJw7Kh1UvHpwv2HtEO3kjc4fxhwVPAjMs3+0YcjkyEtVbUQNXWbZxBJJYyB98br4fCUMY
	ZvXVOpTskSZypK627Y13QZouqO0VvrcrJeZB9h+vudE+2ZiKly+yBOXVhCGit4VxzXbBmF
	qvMD3+dCfaHgJxYr795bRG0+TrwMF+0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-7Sn9U1-WO2WZOLohHt5mYw-1; Fri, 04 Jul 2025 12:20:48 -0400
X-MC-Unique: 7Sn9U1-WO2WZOLohHt5mYw-1
X-Mimecast-MFC-AGG-ID: 7Sn9U1-WO2WZOLohHt5mYw_1751646047
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6face45b58dso12826806d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646047; x=1752250847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/Z64A1L91eoVM0oVYxeXCv31/CXTq/WMm33nMh52sU=;
        b=RmzzAHuKPc/LCwZMfUDdatfmRYLgi/4AiBQk0tZfuhKcVNnjC+ZRSLJafh/M3J1D5g
         JCIqbKCdA6624abEg4oGcTx/il7i5AIxKCnAZx3FCGmh5UtlTuYlkpU4fvpMbHifKifu
         MWHDkyh7imILQvMHHVg3LEbfZVxW0mBdpQRTNQUmHeD5g1Cc5uaKxCV4uGDaGV4a0taq
         TsHH3YSB4ksZXd4F/xztGQlK7fz1/Z7iGDLqOZVCqQQl6aZsgM6E7RlrJ96MX+y2Agx6
         7JFnWCQ1gtCIKTyvmBKZXFticrOwsMqTKWccSZWvFvG3aBS7rvdGi0TOpXTVKwflb1mM
         SVZg==
X-Forwarded-Encrypted: i=1; AJvYcCWGtPgju6jRBr6pvk2/q++SIgVTpHqJi8wDZVK38PZsvy+Tl7iQqMaeG0MXnZDJD4Y9di6zDht4ox2KCXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXtIoDXY9/f7dgIKX5f0zYTphoHfQ3RM+1fuZ9iSv5+GTMIfwE
	38c9v4WsKLeQP6li5D0H/j4f7Lohb5KR7SZDh19KADwogaVq+uUsHWmBuazm0lZYyXd4k2R46cw
	qI/c7000309tbrNS4iZFygGMJudJ66w8fFkx5oTjpPwRCBqIQ/2DfPNYyPenu0wiWhQ==
X-Gm-Gg: ASbGncvP7Q8M7jVA0yLeB/y9eLannz+C4gFOgsqhKgUGH7JUEBAvcxh81/Pav97MW/7
	byADB1oq9oUg99S7QehjlHPIs6O8Z6k4Cs8zj78V3GoPSdBMddfEjkykqwtTUgaaxE0g7oprCyS
	kofzExY/x8fvTsKhGQY2fHIJJpJC7BRwwcYZxUDhblcVARnb7AjmjEYXS7OCAupnsYTPACgHbv1
	aFKza4Dx43iiVpeEqNcLy6kGlhSPsJFVvyiEi6qozi3WmBDCahAIWuN5BuIueCXrqKLkko0ygNA
	p71mhipKeob7UQ==
X-Received: by 2002:ad4:574e:0:b0:6f5:106a:270e with SMTP id 6a1803df08f44-702c8cd9c14mr31160106d6.44.1751646047391;
        Fri, 04 Jul 2025 09:20:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3QKwHLNjLHITPK4hmbCxjyMhaRZnObLUF7+e4ri5Ww0N5q0etFpJdEt757O7D8qHEJZMJGA==
X-Received: by 2002:ad4:574e:0:b0:6f5:106a:270e with SMTP id 6a1803df08f44-702c8cd9c14mr31159896d6.44.1751646047084;
        Fri, 04 Jul 2025 09:20:47 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbeb3186sm166607085a.109.2025.07.04.09.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:20:46 -0700 (PDT)
Date: Fri, 4 Jul 2025 12:20:43 -0400
From: Peter Xu <peterx@redhat.com>
To: Ujwal Kundur <ujwal.kundur@gmail.com>
Cc: akpm@linux-foundation.org, shuah@kernel.org, jackmanb@google.com,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/1] selftests/mm/uffd: Refactor non-composite global
 vars into struct
Message-ID: <aGf_W_ZgIf63dmAz@x1.local>
References: <20250501163827.2598-1-ujwal.kundur@gmail.com>
 <20250702152057.4067-1-ujwal.kundur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702152057.4067-1-ujwal.kundur@gmail.com>

On Wed, Jul 02, 2025 at 08:50:57PM +0530, Ujwal Kundur wrote:
> Refactor macros and non-composite global variable definitions into a
> struct that is defined at the start of a test and is passed around
> instead of relying on global vars.
> 
> Signed-off-by: Ujwal Kundur <ujwal.kundur@gmail.com>

It runs all fine here now.  I didn't check line-by-line, but I keep
thinking this is in general good.

Acked-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu

