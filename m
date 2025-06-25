Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4165A1E5B63
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834997; cv=none; b=nNKyhPYf0CG8afxr/4jJe8snlwKFRed5GouT/0vnyidXwAeuvtvWbIJJJe7t/1BXE21PmwT9+wpsJBuCoLFArW+a12F2WIE4F8N6O3Gv6krp3l+chiyVPXE8Fqa2Y4AJFxx2K5ewkYZG+6buxS6wYDGpC2K9JqcMJ6lr6GSnE34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834997; c=relaxed/simple;
	bh=1euIC+YTtUwRgy4g+dYXPW/+FM5Lhe962gVGmQcpphg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=chCsQMtI7R3c0n1jB/hrMJsFp2lRDUnRn8JGo6Rx5qmInI9i1k0Sd9bXD0nPgGq7fXWlT+9Z8AZaSKOvCtxOdGUhHPPGRQGq2nirgZZStVHdznX+8EO8axZ/0jGwEMeCtSSXHg3Wzv8t1Yng+ldIdImI5PjjQiXWTQTMvsCCp/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWBqd0j2; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWBqd0j2"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-711756ae8c9so11808857b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750834995; x=1751439795; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1euIC+YTtUwRgy4g+dYXPW/+FM5Lhe962gVGmQcpphg=;
        b=NWBqd0j2ZMBQ368MhReXDwEnfEFwbU3s20+wLpVtxfxd8HByipAZBeBteYo523GT6W
         xOpvQx3B4oZuf7Q4AHl+F2pIWK/QGgX6yPI+PvENP73zIQLYCFC26XgniFy0uBcND1NK
         tJCofuCtA8O+CrymL4210aQJVzdBjvqfJC8z5bUZAn6iYqXDcWPyOzCr5kQ79zJcpOHM
         ywdlD2dPfnfj0IJ7XtnHpNFTGWw2MEHDzOUMdPXqv73dTROLLB1n3Hm5RuogHTKFCXNm
         U9dWfOk0pjZKyjRgiU4t9Cctjq9W/s1ePsJxO72gKyu7GZ29iYVTa3Y4aUuhNvQKjH7n
         9fZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750834995; x=1751439795;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1euIC+YTtUwRgy4g+dYXPW/+FM5Lhe962gVGmQcpphg=;
        b=JFlZJ6cgfPyaZ22eue/coyZHdfH/Wbq+gRWqzZHP0mkN9PZAFSy2dmgQEByLJ/pbaC
         LhHaGXaj7/2xxrXWYfhAWr5Q+rz4NALvoVn4WxTXLEWh1u76bk/tK2WPHxDjrVwE/Ut3
         08hb/MrVR9o/YuYcQiKi6fCCaedLbjGcC4I2zruRoUtrhULr69RxTM6XZAnlzay0BE60
         6uXqVpdyKvVXfyJovNi36TzUbzCo65XbXGUmyjAqHU1uWVWZHtRo6q6QyiULSRoNyQcy
         quo8SzJvvjwEpm1rviZQiva2S5WwvpxY7CWVRkawRoWu+lJkLHoti9wZiTQlV7cJw0IH
         BPYg==
X-Gm-Message-State: AOJu0Ywod8z+OD9VgeJ0PVMNKNt+7IsO2NbA+a00O00PAdp61eQQxEzw
	GEBaFOsHfTQqpqbUSt8Cm5Qa36ZKr+JUjS536rdZWfPnOyCySBjNXjNsHJg8y9HHos4/0ov/rSx
	KAW4EHY6W23WKog+83sAWYl/Qz3inu8fYUEBm7q0YMg==
X-Gm-Gg: ASbGncsvOLfOnpacpWuvNIa+PRWCG/mOY5diovDXU0h/JFGY7PcPkhk7udlpD8rQsoo
	LozIl4GoNrsw5oqB6EE7B1CuuuysyhhiN69/FBPcR3SXjjwHmleE4zzYvhsoZkG0s19NDoLp8UF
	JSrYgoyoLWEELMOgeGEWDATu9NKPpJVZ56Up3fXFSVYJkZKnI4qrjQUzW/vJ9Dz60bzJnJSBAEJ
	/l+yA==
X-Google-Smtp-Source: AGHT+IFP+KCnaf+qPgq1oe/i3QY36E+4AybnVOO6FwxB0VADhpL3jAgQaQO0xdqcw6GLhTxIcYqYuXdBQHZNRNmQUFA=
X-Received: by 2002:a05:690c:360d:b0:70c:a57c:94ba with SMTP id
 00721157ae682-71406da0855mr25798947b3.17.1750834995078; Wed, 25 Jun 2025
 00:03:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Wed, 25 Jun 2025 12:33:04 +0530
X-Gm-Features: AX0GCFs0Asn4PGB2EoiGHuih24LeAjRKj2QO1cq4iEcQanjuJMt2RX_wIQ1VpIA
Message-ID: <CAFf+5zhvusE2bPiTA40wJ39UZHCaW+TyiE7E1ZEERQJS9sLcdA@mail.gmail.com>
Subject: Bash script to generate random ascii string lines (printable
 characters only, including space) with lengths within a min-max range.
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

#!/bin/bash

min=50
max=110

while true; do

len=`shuf -i $min-$max -n 1`

tr -dc '[:print:]' < /dev/urandom | dd ibs=$len count=1 status=none; echo

done
