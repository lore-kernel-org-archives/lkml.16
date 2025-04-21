Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9504257449
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 04:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745209598; cv=none; b=LQSU5Ds/062osTLfhtXDSQ7Pg7qiZQxQC5M6983iSiMxnNEO6sTwmQOu00PDNFOCmIRLOPaygrcHQWB5+fqqFHJem4q5I0tAw0Buy1Xh3TSt8LPlI3A2x0sCooVIOYZyTF3J/tQ4tgucN7QZ78gXrd2CTp2trGDtVFIVzo8nzkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745209598; c=relaxed/simple;
	bh=d1uH2WOYbfu8vP+fnv2qaV3rjRXrD49f0j0Rv92vBUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sPoi0DBdfnOFhiuVOKaRBJgJEcvnfWP3BEuSfEASWZAJ7Ws9hBlhfZw5PZUzSq1MxL7fJY6nH7Ap3To+z4MuHebyH2wavn1QwSerDbv/sJzwn+mMlTemJS8bA8YhfOKpHJsCU3Cu7/F8soArCFsNXps1a6V6ggBs7VtHaQWBbqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=bB3ZCTmz; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="bB3ZCTmz"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c08f9d0ef3so171730685a.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 21:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1745209595; x=1745814395; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qLXMwjq74bNK6BOfgJ7phL0lyY08ZAolUu+OAsiQ9to=;
        b=bB3ZCTmzvM0psKRqKmYk3tgskGYPvACrqv0xD9A9AiwWFXxuqPA0GVPAVk9Y+EOhFz
         +yQc4MOQCsXtMDWBVmw2rAwW8cwCpL41+75Yp5JHuFp2tPkSGngxcqsw9hgifXoPgQKD
         iwEj/EsbGEKRZ0JQqrljeOxsCyjQFXuuPDvLV0P1QpyO8bK9dYyim/DCxZ0qMGMAcP3K
         Qg9yftJDxNjLxzz5rDSM0UqXWDX2FATaql3OCiLPwykykAXByQVl8h9wR5Kj0pRqHL51
         hTXs+vzS9Zb2SLUFwyDDLbiehi9zmQsO3yQ1AlEejm2ll8hTbRnYImlNM7EK8jjdVt/s
         gqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745209595; x=1745814395;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qLXMwjq74bNK6BOfgJ7phL0lyY08ZAolUu+OAsiQ9to=;
        b=GDiuxfHwR2G1mDxCSQBP5n2AsoNpUG/Q2mexcgT6L5KkFRfiWQvp4LBzoCUa5TfxEX
         qWkG1zRLe0bNW6LV9GOQE2Oz3PmYGVZIF3OsSBV0+GroJUKMAI6Ivo/L1b4z0/wfYa7T
         fUWnVgZnkxl1DXxvwEpNXMh/pKltZM+7mI3l9IbPK+fkzO2vw0iVmCzcLikJEq+7gpJo
         yhp7stMuAYniDp9VlMgITH7hbaT/OJrhTAZgt4E2WlpRnywYtjgsFJXIR2ctKX3Ytjpy
         bzbLBbSZFK6hCx6z/D+6hVwLznMMHcCvy6OZvIUjcebpNwbVIZ6Ngh298reFK0UO/cRR
         rjYg==
X-Gm-Message-State: AOJu0YznWZ4zvnk008ehQ9XRQlwZzrhqHxlfETDeyZrTEnQ46gpJweU9
	prVhi9OxQMKL2H95Xqn61Of1CTq0wLbwoTK/qrMpZkSrqbA3VN7ihBbgJJOzWmrmICgsIQozRle
	66YA=
X-Gm-Gg: ASbGnctemifKx9+YyXNzEXf+JGeRUKILyflI9kScAqjnKNrHequowNgBdqNd3V6pBns
	dNjtrzIVKSmOZoADJlRI56w1JXB7i09i6crIwxMzcWUHv0QzZQTjFK17lPfTRHbF0S5CiEN9MGT
	s0ZLnpjteo7LmYJNAsN3nc6JSlfRFGxiwQn26w6bniVUKq5JTGdjtdt0hYFwVeumhBioT2t8AUO
	tBSaEJil7BkigfzDy14FlpD8UM/t55WgrL6J9+Ty7ykk5JaIfY3N9EB/axlKQ9uM+lm5mBbM+Gk
	HyNLFfyqRxmKTSvNpx/DnklYNYcjYbdWuFe4AvOzuqKHdrBCTaE6g9m7tNkdlS654ozNbg==
X-Google-Smtp-Source: AGHT+IH3TnmhAg1TTlz4bLDFMIRiDBWG/0r9tsSd+aOYXwB1Hw87ZxRvl3foghRcH3dPlVidUnuInA==
X-Received: by 2002:a05:620a:1a89:b0:7c5:3d60:7f88 with SMTP id af79cd13be357-7c927f776d0mr1265005885a.16.1745209595407;
        Sun, 20 Apr 2025 21:26:35 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b4dc09sm380262485a.73.2025.04.20.21.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 21:26:35 -0700 (PDT)
Date: Mon, 21 Apr 2025 00:26:33 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	regressions@lists.linux.dev
Cc: Douglas Anderson <dianders@chromium.org>
Subject: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
Message-ID: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I recently noticed that on current kernels I lose video output from
my Blackbird's AST2500 BMC after a reboot, which makes it difficult to
boot the system again (the video output will come on only after Linux
is booted again).

With Linux 6.6 and earlier, there is no problem rebooting, everything
is fine.

I bisected to this commit:

  ce3d99c8349584bc0fbe1e21918a3ea1155343aa is the first bad commit
  commit ce3d99c8349584bc0fbe1e21918a3ea1155343aa
  Author: Douglas Anderson <dianders@chromium.org>
  Date:   Fri Sep 1 16:39:53 2023 -0700

      drm: Call drm_atomic_helper_shutdown() at shutdown time for misc drivers

This commit does not revert cleanly on 6.14, but I can easily undo
the changes this commit made to the ast driver, and this is enough
to restore working behaviour.

Let me know if you need any more info!

Thanks,
  Nick
