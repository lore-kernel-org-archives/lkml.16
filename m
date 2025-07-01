Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889FF1F239B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751363208; cv=none; b=N9WdGeTmBSrjWvk1dJFLVq5GlldjtW+deYClUG0UKyIQDZ738KSDKw09/UWgmbldDweUKBPKn9uHg9ZGd+gqNK5K3/T5rPxQhmieeag35CzjNNi0i9pgqKwC34wqPnzO12ZpoXh37/MeZqbhtp/kv6yQG3oDa+FlochMEghlU20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751363208; c=relaxed/simple;
	bh=u8eQPXTq595/9P5sz1sIlTx9nk5+OiYGc5gxzP27Ots=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MGCYX9//Cd51Xz7C0m6mLQ3th/QpgLFPHtLakVt0Db2R+hw45uEPlwfDwwmKo+a4Nd4wFXbtqmpFtMmQLoUJgYaKwnnQdDB7sAG8ZHlpC/Qg0QtVuEzOmdWN69kS2buA/bsVaGbtns3yr0B85HYl1PAGxy2SybgpVB+kSOcNaxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRAFq71+; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRAFq71+"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70e4b1acf41so25127037b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 02:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751363205; x=1751968005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=adw9AtmAKkR03qobX19/k7gE8iy5Pgo/IUh30/wiTNQ=;
        b=jRAFq71+riIRsjSjIVpudwBrKPQR0XPNAQkGqBtHUgPIRjPka5AbKYWE5/GSne99T1
         4mn48oltub97Xb8hdhqsjuhYoKCGnuj4cnqRCGwdW9sA1fI+fkJtzoOVimhpZ1XJfWNy
         YCez2LFfI6mu5/ISgOA5o40H3/q9UQqJG2x4MenhfJAuADmNXpGgQjDB5zjh0+xKx2Db
         cFs5g8QozpO/v13KYMsd9xyDBIQALrQJZRGclpe3PJdjTHF3NLkCJCQz79xSO5Ry3TaJ
         KoSx8rI3bmj8nsBEWXCnnmKNOyHpG0osP2M2avXRDHVunz0QuJdhIBVNB3X4rt/PytwH
         RHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751363205; x=1751968005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adw9AtmAKkR03qobX19/k7gE8iy5Pgo/IUh30/wiTNQ=;
        b=NwAeQn8xcUY18I26CuTQM7E7BNr0BO81DXCXJXIvDofd10ePd3VGwzVfiHYlN8e7q4
         o0RgdV9qtdi0n93SyJKy5/XETJr8V7BlbpuqopJ4tAcg1x6uhQ4Kr00+k2xaa0aSzjqI
         Qb7G+QPsC6SqOuftbZCTj90TmffPTXHa4h9A5Ue0U4gZvd2wKVA8+NOyDJjTJJXeloJw
         M6AOere8Cvv7umiCLU5bUxzWYX36w9XasIbg1HpxFKFcKVcGplk420O5b4B7W6kXyh4b
         qs5opavo/BLi5tZ/+EF/YI5PpQFGN7R5c/c5b258HrlMqzp9+GvepMyE8KdJi590Mywr
         afIA==
X-Forwarded-Encrypted: i=1; AJvYcCUUhXVLX9RyphztqRhhrQxTDOKhjMhdkfOoOdNasz6Clej87P6cP+vR9t6WVRoFEu0Jw2Nwe8qkpeYfGxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA2DxmefPhlH5ASz/xxyf+rO4X17skvqA28v8AnR/q5d5qZho2
	3YuweiuA5mtoHJJWQcMhpBvmC9z1T/raX9bcTXRyJIHP86UdE9MOXkJeko+TRikJkKU=
X-Gm-Gg: ASbGncujjXZETOmPShL/bsi5hUGeSlWSfyAQB/faly+VG20yrTEhKUIYYnF7nqlhlv8
	87cQh3KnzEYWPfTSoG0Ddh/0RrbOcZLxWsxAyJSOiZKw4NmG0eJh9ZYTzpb+lfguu7yq0p32cVg
	qcw1S19jcZROQiMXEHSybsncUXADvGnL+EDRODGFi8upI8k4EsqdM4Gi0GUDZlDzpO0UO12hN4p
	AirwzqF/hscYX8Txb2LBfDEoSoI34X71nj1sEsmG7esUaRzQ9lUgjx7rywFgZNvhoXGTGk4IjnZ
	DabRYnIppOO0ypF4lhZHxOCvtNhvokxe7beuOjpw9DbhYvMuTNP8f1DpiSZJbTTOlcoLZj7K
X-Google-Smtp-Source: AGHT+IEZuU9iIlyPaR0v8qouv97qhBTEadqtDJk3Jq6/2x+BT69zQM1/zyy9cye5W8NDl27DEP2Flg==
X-Received: by 2002:a05:690c:67ca:b0:70f:7483:5a34 with SMTP id 00721157ae682-715171aba9fmr258427827b3.32.1751363205282;
        Tue, 01 Jul 2025 02:46:45 -0700 (PDT)
Received: from Gentoo.localdomain ([191.96.150.39])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515cc809dsm19225897b3.113.2025.07.01.02.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:46:44 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] tools: mm: Added modern version of shell quote and a stranza for required command check
Date: Tue,  1 Jul 2025 15:07:08 +0530
Message-ID: <20250701094603.23933-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three things precisely:

Replaed backquote with dollar-parentheses ...that is modern way of quoting in
shell script.

Added a stranza of missing/required command for the operation, in this case
gnuplot and that too in the command shell path.

And lastly, command with -v print the path of command i.e location for the
command to be executed.


Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 tools/mm/slabinfo-gnuplot.sh | 45 +++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/tools/mm/slabinfo-gnuplot.sh b/tools/mm/slabinfo-gnuplot.sh
index 873a892147e5..de621963b3d1 100644
--- a/tools/mm/slabinfo-gnuplot.sh
+++ b/tools/mm/slabinfo-gnuplot.sh
@@ -38,6 +38,23 @@ usage()
 	echo "-r %d,%d		- use data samples from a given range"
 }

+
+# This varialble could have space separated commands
+my_needed_commands="gnuplot"
+
+missing_counter=0
+for needed_command in $my_needed_commands; do
+  if ! hash "$needed_command" >/dev/null 2>&1; then
+    printf "Command not found in PATH: %s\n" "$needed_command" >&2
+    ((missing_counter++))
+  fi
+done
+
+if ((missing_counter > 0)); then
+  printf "Minimum %d commands are missing in PATH, aborting\n" "$missing_counter" >&2
+  exit 1
+fi
+
 check_file_exist()
 {
 	if [ ! -f "$1" ]; then
@@ -58,13 +75,13 @@ do_slabs_plotting()

 	check_file_exist "$file"

-	out_file=`basename "$file"`
+	out_file=$(basename "$file")
 	if [ $xmax -ne 0 ]; then
 		range="$range::$xmax"
 		lines=$((xmax-xmin))
 	fi

-	wc_lines=`cat "$file" | wc -l`
+	wc_lines=$(cat "$file" | wc -l)
 	if [ $? -ne 0 ] || [ "$wc_lines" -eq 0 ] ; then
 		wc_lines=$lines
 	fi
@@ -78,7 +95,7 @@ do_slabs_plotting()
 		xtic_rotate=90
 	fi

-gnuplot -p << EOF
+$(command -v gnuplot) -p << EOF
 #!/usr/bin/env gnuplot

 set terminal png enhanced size $width,$height large
@@ -113,14 +130,14 @@ do_totals_plotting()
 	for i in "${t_files[@]}"; do
 		check_file_exist "$i"

-		file="$file"`basename "$i"`
+		file="$file"$(basename "$i")
 		gnuplot_cmd="$gnuplot_cmd '$i' $range using 1 title\
 			'$i Memory usage' with lines,"
 		gnuplot_cmd="$gnuplot_cmd '' $range using 2 title \
 			'$i Loss' with lines,"
 	done

-gnuplot -p << EOF
+$(command -v gnuplot) -p << EOF
 #!/usr/bin/env gnuplot

 set terminal png enhanced size $width,$height large
@@ -148,26 +165,26 @@ do_preprocess()

 	# use only 'TOP' slab (biggest memory usage or loss)
 	let lines=3
-	out=`basename "$in"`"-slabs-by-loss"
-	`cat "$in" | grep -A "$lines" 'Slabs sorted by loss' |\
+	out=$(basename "$in")"-slabs-by-loss"
+	$(cat "$in" | grep -A "$lines" 'Slabs sorted by loss' |\
 		grep -E -iv '\-\-|Name|Slabs'\
-		| awk '{print $1" "$4+$2*$3" "$4}' > "$out"`
+		| awk '{print $1" "$4+$2*$3" "$4}' > "$out")
 	if [ $? -eq 0 ]; then
 		do_slabs_plotting "$out"
 	fi

 	let lines=3
-	out=`basename "$in"`"-slabs-by-size"
-	`cat "$in" | grep -A "$lines" 'Slabs sorted by size' |\
+	out=$(basename "$in")"-slabs-by-size"
+	$(cat "$in" | grep -A "$lines" 'Slabs sorted by size' |\
 		grep -E -iv '\-\-|Name|Slabs'\
-		| awk '{print $1" "$4" "$4-$2*$3}' > "$out"`
+		| awk '{print $1" "$4" "$4-$2*$3}' > "$out")
 	if [ $? -eq 0 ]; then
 		do_slabs_plotting "$out"
 	fi

-	out=`basename "$in"`"-totals"
-	`cat "$in" | grep "Memory used" |\
-		awk '{print $3" "$7}' > "$out"`
+	out=$(basename "$in")"-totals"
+	$(cat "$in" | grep "Memory used" |\
+		awk '{print $3" "$7}' > "$out")
 	if [ $? -eq 0 ]; then
 		t_files[0]=$out
 		do_totals_plotting
--
2.49.0

